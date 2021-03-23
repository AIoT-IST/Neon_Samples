#!/usr/bin/python3

"""
    This sample demonstrate the one-shot image capturing of the build-in Basler camera.
    The camera python API used is called pypylon and the package github url is https://github.com/basler/pypylon    
"""


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
    
    # Grabing Continusely (video) with minimal delay
    numberOfImagesToGrab = 1
    camera.StartGrabbingMax(numberOfImagesToGrab) 
    
    # converting to opencv bgr format
    converter = pylon.ImageFormatConverter()
    converter.OutputPixelFormat = pylon.PixelType_BGR8packed
    converter.OutputBitAlignment = pylon.OutputBitAlignment_MsbAligned

    grabResult = camera.RetrieveResult(5000, pylon.TimeoutHandling_ThrowException)

    if grabResult.GrabSucceeded():
        # Access the image data
        image = converter.Convert(grabResult)
        frame = image.GetArray()
        log.info("Image Capture sucessfully...displaying image")    
        print("To close the application, press 'CTRL+C' here or switch to the output window and press any key")

        cv2.namedWindow(title, cv2.WINDOW_NORMAL)
        cv2.imshow(title, frame)

        key = cv2.waitKey(0)
        
    cv2.destroyAllWindows()

if __name__ == '__main__':
    sys.exit(main() or 0)
