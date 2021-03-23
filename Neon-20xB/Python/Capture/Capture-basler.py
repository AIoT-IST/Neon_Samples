#!/usr/bin/python3

"""
    This sample demonstrate the continuously image capturing of the build-in Basler and Appropho camera.
    The basler camera python API used is called pypylon and the official package github url is https://github.com/basler/pypylon
"""

import logging
import os
import sys
from pypylon import pylon
import cv2

logging.basicConfig(format="[ %(levelname)s ] %(message)s", level=logging.INFO, stream=sys.stdout)
log = logging.getLogger()

#---------------------------Parameters------------------------------------
#Width=800
#Height=600
#Gain=10
#ExposureTime=3500
#FrameRate=30
#-------------------------------------------------------------------

def main():
    log.info("To close the application, press 'CTRL+C' here or switch to the output window and press ESC key")
    
    # --------Basler camera--------------------       
    # conecting to the first available camera
    camera = pylon.InstantCamera(pylon.TlFactory.GetInstance().CreateFirstDevice())
    log.info("Starting initialize Basler camera...")
    camera.Open()

    #Setting image size
    #camera.Width.Value=Width
    #camera.Height.Value=Height
    
    #Setting Gain
    #camera.GainAuto.SetValue("Off") 
    #camera.Gain=Gain
    
    #Setting Exposure Time
    #camera.ExposureAuto.SetValue("Off")
    #camera.ExposureTime.SetValue(ExposureTime)    

    #Setting Frame Rate
    #camera.AcquisitionFrameRate.SetValue(FrameRate)  

    # Grabing Continusely (video) with minimal delay
    camera.StartGrabbing(pylon.GrabStrategy_LatestImageOnly) 
    converter = pylon.ImageFormatConverter()

    # converting to opencv bgr format
    converter.OutputPixelFormat = pylon.PixelType_BGR8packed
    converter.OutputBitAlignment = pylon.OutputBitAlignment_MsbAligned

    log.info("Starting cature image...")        

    while camera.IsGrabbing():
        grabResult = camera.RetrieveResult(5000, pylon.TimeoutHandling_ThrowException)
        if grabResult.GrabSucceeded():
                # Access the image data
                image = converter.Convert(grabResult)
                frame = image.GetArray()
                cv2.imshow("Preview of Basler Camera --- Exit by press 'ESC' key", frame)

                # Exit by press "ESC" key
                if cv2.waitKey(1) == 27:
                        break

    cv2.destroyAllWindows()

if __name__ == '__main__':
    sys.exit(main() or 0)
