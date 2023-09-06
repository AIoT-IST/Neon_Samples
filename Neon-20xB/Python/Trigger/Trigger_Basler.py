#!/usr/bin/python3

"""
    This sample demonstrate the one-shot image capturing of the build-in Basler camera.
    The camera python API used is called pypylon and the package github url is https://github.com/basler/pypylon    
"""

import time
import logging
import os
import sys
from pypylon import pylon
import cv2

logging.basicConfig(format="[ %(levelname)s ] %(message)s", level=logging.INFO, stream=sys.stdout)
log = logging.getLogger()

def main():
    title = "Image Capture One Shot"
    log.info("Starting initial camera...")
    # --------Basler camera--------------------
    # conecting to the first available camera
    camera = pylon.InstantCamera(pylon.TlFactory.GetInstance().CreateFirstDevice())
    camera.Open()

    # Set camera trigger mode
    camera.TriggerMode.SetValue('On')
    camera.TriggerSource.SetValue('Line1')    

    # Grabing Continusely (video) with minimal delay
    camera.StartGrabbing(pylon.GrabStrategy_LatestImageOnly)

    
    # converting to opencv bgr format
    converter = pylon.ImageFormatConverter()
    converter.OutputPixelFormat = pylon.PixelType_BGR8packed
    converter.OutputBitAlignment = pylon.OutputBitAlignment_MsbAligned



    while camera.IsGrabbing():
   
        grabResult = camera.RetrieveResult(0, pylon.TimeoutHandling_Return)
        if grabResult.IsValid():

        # Access the image data
            cv2.destroyAllWindows()
            time.sleep(0.25)
            image = converter.Convert(grabResult)
            frame = image.GetArray()
            log.info("Image Capture sucessfully...displaying image")    
        

            cv2.namedWindow(title, cv2.WINDOW_NORMAL)
            cv2.imshow(title, frame)

            if cv2.waitKey(1) == 27:
                break


if __name__ == '__main__':
    sys.exit(main() or 0)
