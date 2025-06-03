import pypylon.pylon as py
import numpy as np
import cv2
import open_evision as oev
import ctypes
import time
from open_evision import EasyDeepLearning, EasyDeepOCR

# === Global Variables ===
roi_start_point = None
roi_end_point = None
drawing_roi = False
ocr_ready = False
last_frame = None
ocr_result_texts = []
ocr_execution_time_ms = 0.0

# === Mouse Callback Function ===
def mouse_callback(event, x, y, flags, param):
    global roi_start_point, roi_end_point, drawing_roi, ocr_ready
    if event == cv2.EVENT_LBUTTONDOWN:
        roi_start_point = (x, y)
        roi_end_point = None
        drawing_roi = True
        ocr_ready = False
    elif event == cv2.EVENT_MOUSEMOVE and drawing_roi:
        roi_end_point = (x, y)
    elif event == cv2.EVENT_LBUTTONUP:
        roi_end_point = (x, y)
        drawing_roi = False
        ocr_ready = True

# === Initialize Basler Camera ===
camera_factory = py.TlFactory.GetInstance()
camera = py.InstantCamera(camera_factory.CreateFirstDevice())
camera.Open()
camera.PixelFormat = "RGB8"
print("[INFO] Using Camera:", camera.DeviceModelName.GetValue())

# === Initialize EasyDeepOCR ===
ocr_reader = EasyDeepOCR.ETextReader()
ocr_settings = EasyDeepLearning.EDeepLearningExecutionSettings()
ocr_settings.Engine = "EasyDeepLearningEngine_TensorRT"
ocr_settings.DeviceByName = "GPU 0"
#ocr_settings.Engine = "default"
#ocr_settings.DeviceByName = "CPU"
ocr_settings.InferencePrecision = EasyDeepLearning.EDeepLearningInferencePrecision.FLOAT32
ocr_reader.ExecutionSettings = ocr_settings

start_time = time.time()
print(f"[INFO] Text Reader Initialization started at {time.strftime('%H:%M:%S', time.localtime(start_time))}")
ocr_reader.Initialize()
end_time = time.time()
print(f"[INFO] Text Reader Initialization finished at {time.strftime('%H:%M:%S', time.localtime(end_time))}")
print(f"[INFO] Initialization took {end_time - start_time:.2f} seconds")

# Set OCR Topology
ocr_topology_lines = [
    EasyDeepOCR.ETopologyLine("S{1,40}", EasyDeepOCR.ETopologyFormatType.Simplified)
]
ocr_reader.Topology = EasyDeepOCR.ETopology(ocr_topology_lines)

# === Start Live Stream ===
print("[INFO] Engine preload successfully")
camera.StartGrabbing()
cv2.namedWindow("OCR Live View")
cv2.setMouseCallback("OCR Live View", mouse_callback)

while camera.IsGrabbing():
    with camera.RetrieveResult(1000) as result:
        if result.GrabSucceeded():
            frame = result.Array
            display_frame = frame.copy()
            last_frame = frame.copy()
                        
            # Fix color (RGB to BGR) for OpenCV display
            display_frame = cv2.cvtColor(display_frame, cv2.COLOR_RGB2BGR)

            # Draw ROI rectangle
            if roi_start_point and roi_end_point:
                cv2.rectangle(display_frame, roi_start_point, roi_end_point, (255, 0, 0), 2)  # Blue Rectangle

            # Display OCR results on the top-left corner
            base_x, base_y = 10, 30
            font = cv2.FONT_HERSHEY_SIMPLEX
            font_scale = 1.2
            font_thickness = 3
            line_gap = 40

            cv2.putText(display_frame, f"DeepOCR Time: {ocr_execution_time_ms:.1f} ms",
                        (base_x, base_y), font, font_scale, (0, 255, 255), font_thickness)  # Yellow

            for i, text_str in enumerate(ocr_result_texts):
                y_position = base_y + (i + 1) * line_gap
                cv2.putText(display_frame, text_str, (base_x, y_position), font, font_scale, (0, 255, 0), font_thickness)

            # Perform OCR once ROI is drawn
            if ocr_ready and roi_start_point and roi_end_point:
                ocr_ready = False
                x1, y1 = roi_start_point
                x2, y2 = roi_end_point
                x1, x2 = sorted((x1, x2))
                y1, y2 = sorted((y1, y2))
                roi_image = np.copy(last_frame[y1:y2, x1:x2])

                h, w, _ = roi_image.shape
                if h > 0 and w > 0:
                    e_img = oev.EImageC24()
                    ptr = ctypes.c_void_p(roi_image.ctypes.data)
                    raw_bits_per_row = w * 3 * 8
                    aligned_bits_per_row = ((raw_bits_per_row + 31) // 32) * 32
                    e_img.SetImagePtr(w, h, ptr, aligned_bits_per_row)

                    ocr_region = oev.ERectangleRegion(0, 0, w, h)
                    try:
                        start_ocr = time.time()
                        results = ocr_reader.Read(e_img, ocr_region)
                        end_ocr = time.time()
                        ocr_execution_time_ms = (end_ocr - start_ocr) * 1000.0

                        ocr_result_texts = []
                        print("[INFO] OCR Results:")
                        for text in results:
                            decoded = text.String
                            ocr_result_texts.append(decoded)
                            print(f" - {decoded}")
                    except Exception as e:
                        print(f"[WARN] OCR skipped: {e}")
                else:
                    print("[WARN] Invalid ROI size.")

            cv2.imshow("OCR Live View", display_frame)
            key = cv2.waitKey(1) & 0xFF
            if key in (ord('q'), 27):
                break

# === Cleanup ===
camera.StopGrabbing()
camera.Close()
cv2.destroyAllWindows()

