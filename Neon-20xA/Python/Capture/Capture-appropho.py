#!/usr/bin/python3
"""
    This sample demonstrate the continuously image capturing of the build-in Appropho camera.
"""

import logging
import os
import sys
import cv2

logging.basicConfig(format="[ %(levelname)s ] %(message)s", level=logging.INFO, stream=sys.stdout)
log = logging.getLogger()

def main():
    log.info("To close the application, press 'CTRL+C' here or switch to the output window and press ESC key")
    
    # --------Appropho camera--------------------
        
    log.info("Starting initialize Appropho camera...")
    cap = cv2.VideoCapture(0)

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
