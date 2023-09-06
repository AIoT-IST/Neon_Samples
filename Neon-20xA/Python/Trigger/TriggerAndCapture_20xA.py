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

    log.info("Starting cature image...") 

def neon_listenTrigger(index, value):

    ret, frame = cap.read()   
    cv2.imwrite("test.bmp", frame)    
    print("Save image success!")


def DITrigger():
    #Set DI callback
    TriggerCBFunc = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_uint, ctypes.c_int)
    neon_TriggerCallBack_func = TriggerCBFunc(neon_listenTrigger) 
    result = lib.Neon_SetDITriggerCallback(neon_TriggerCallBack_func)
    print("Set Callback Success!")

def loop():
    while(True):
        y=1


capture()
loadclib = ctypes.cdll.LoadLibrary   
lib = loadclib("/usr/lib/Neon/libNeon.so")
DITrigger()

loop()
