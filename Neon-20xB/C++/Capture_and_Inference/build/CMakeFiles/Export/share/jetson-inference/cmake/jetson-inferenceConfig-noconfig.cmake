#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "jetson-inference" for configuration ""
set_property(TARGET jetson-inference APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(jetson-inference PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "/usr/local/cuda-10.2/lib64/libcudart_static.a;-lpthread;dl;/usr/lib/aarch64-linux-gnu/librt.so;jetson-utils;nvinfer;nvinfer_plugin;nvcaffe_parser;opencv_core;opencv_calib3d;Qt4::QtGui;GL;GLEW;gstreamer-1.0;gstapp-1.0;-L/opt/pylon5/lib64 -Wl,-E -lpylonbase -lpylonutility -lGenApi_gcc_v3_1_Basler_pylon -lGCBase_gcc_v3_1_Basler_pylon;pylonutility;pylonbase;GCBase_gcc_v3_1_Basler_pylon_v5_1;nvonnxparser;opencv_core;opencv_calib3d"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libjetson-inference.so"
  IMPORTED_SONAME_NOCONFIG "libjetson-inference.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS jetson-inference )
list(APPEND _IMPORT_CHECK_FILES_FOR_jetson-inference "${_IMPORT_PREFIX}/lib/libjetson-inference.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
