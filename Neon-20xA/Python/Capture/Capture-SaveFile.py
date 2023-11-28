#!/usr/bin/python3
"""
    This sample demonstrate the continuously image capturing of the build-in Appropho camera.
"""

import logging
import os
import sys
import cv2
import time

logging.basicConfig(format="[ %(levelname)s ] %(message)s", level=logging.INFO, stream=sys.stdout)
log = logging.getLogger()

def main():
    log.info("To close the application, press 'CTRL+C' here or switch to the output window and press ESC key")
    
    # --------Appropho camera--------------------
        
    log.info("Starting initialize Appropho camera...")
    cap = cv2.VideoCapture(0,cv2.CAP_V4L)

    #Check if camera was opened correctly
    if not (cap.isOpened()):
        log.info("Could not open Appropho camera")


    #Set the resolution
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 3840)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 2160)

    log.info("Starting cature image...") 

    # Capture frame-by-frame
    while(True):
        ret, frame = cap.read()

        # Display the resulting frame     
        cv2.imshow("Preview of Appropho Camera --- Exit by press 'ESC' key",frame)                        

        #Waits for a user input to quit the application
        #"Space" to snapshoot
        iKey = cv2.waitKey(100);
        #if cv2.waitKey(1) == 27:
        #    break
        if iKey == 32:
            strTime = time.strftime("%m%d-%H%M%S_8M_WD300.png")
            cv2.imwrite(strTime, frame)
        elif iKey == 27:
            break

    cv2.destroyAllWindows()

    # When everything done, release the capture
    cap.release()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    sys.exit(main() or 0)
