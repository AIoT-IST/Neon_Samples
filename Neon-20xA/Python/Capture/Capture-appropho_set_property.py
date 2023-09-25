#!/usr/bin/python3
"""
    This sample demonstrate the continuously image capturing of the build-in Appropho camera.
"""

import logging
import os
import sys
import cv2

import subprocess

logging.basicConfig(format="[ %(levelname)s ] %(message)s", level=logging.INFO, stream=sys.stdout)
log = logging.getLogger()

def main():
    log.info("To close the application, press 'CTRL+C' here or switch to the output window and press ESC key")
    
    # --------Appropho camera--------------------
        
    log.info("Starting initialize Appropho camera...")
    cap = cv2.VideoCapture(0,cv2.CAP_V4L)


    # set manual_exposure 0:disable(default) 1:Enable
    try:
        subprocess.run(["v4l2-ctl", "-c", "manual_exposure=1"])
        print("Exposure mode set to manual")
    except subprocess.CalledProcessError:
        print("Failed to set exposure mode to manual")

    # set manual_gain step=1000, default=1000
    new_gain_value = 7000  

    try:
        subprocess.run(["v4l2-ctl", "-c", f"manual_gain={new_gain_value}"])
        print(f"Gain set to {new_gain_value}")
    except subprocess.CalledProcessError:
        print(f"Failed to set gain to {new_gain_value}")


    #Check if camera was opened correctly
    if not (cap.isOpened()):
        log.info("Could not open Appropho camera")


    #Set the resolution
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1920)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 1080)

    log.info("Starting cature image...") 

    # Capture frame-by-frame
    while(True):
        ret, frame = cap.read()

        # Display the resulting frame     
        cv2.imshow("Preview of Appropho Camera --- Exit by press 'ESC' key",frame)                        

        #Waits for a user input to quit the application
        if cv2.waitKey(1) == 27:
            break

    cv2.destroyAllWindows()

    # When everything done, release the capture
    cap.release()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    sys.exit(main() or 0)
