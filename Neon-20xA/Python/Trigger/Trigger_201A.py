#!/usr/bin/python3

import ctypes 
import logging
import os, sys
import threading
import cv2
import time

logging.basicConfig(format="[ %(levelname)s ] %(message)s", level=logging.INFO, stream=sys.stdout)
log = logging.getLogger()


def capture():
    title = "To close the application, press 'CTRL+C'"
    log.info("To close the application, press 'CTRL+C' here")
    global cap
    # --------Appropho camera--------------------
    # Set camera to continue mode 
    os.system("v4l2-ctl --set-ctrl=trigger_mode=0")
    log.info("Starting initialize Appropho camera...")
    cap = cv2.VideoCapture(0,cv2.CAP_V4L)
    #Check if camera was opened correctly
    if not (cap.isOpened()):

        log.info("Could not open Appropho camera")
    #Set the resolution
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1920)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 1080)



    # Set camera trigger mode
    os.system("v4l2-ctl --set-ctrl=trigger_mode=1")
    os.system("v4l2-ctl --set-ctrl=low_latency_mode=1")
 
    log.info("Wait for trigger...") 

    while cap.isOpened():
  # Access the image data

        grabResult=cap.grab()       
        if grabResult==True:

            grabResult,frame =cap.retrieve()
            if grabResult!=False:

                log.info("Image Capture sucessfully...displaying and saving image") 
   
              #Display image
                cv2.namedWindow(title, cv2.WINDOW_NORMAL)
                cv2.imshow(title, frame)
              
              #Save image
                cv2.imwrite("Test.bmp", frame)  


                if cv2.waitKey(1) == 27:
                    break


if __name__ == '__main__':
    sys.exit(capture() or 0)
