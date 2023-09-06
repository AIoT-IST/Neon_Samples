import ctypes  
import os, sys
import threading
import logging
import cv2

count=0

#The following code shows how to call the sdk library in the python

def neon_listenTrigger(index, value):
    global count
   
    print("Count:"+str(count)+" DI:"+str(index)+" Status"+str(value))
    count=count+1

def DITrigger():
    #Set DI callback
    TriggerCBFunc = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_uint, ctypes.c_int)
    neon_TriggerCallBack_func = TriggerCBFunc(neon_listenTrigger) 
    result = lib.Neon_SetDITriggerCallback(neon_TriggerCallBack_func)
    print("Set Callback Success!")

def loop():
    while(True):
        y=1

#load library
loadclib = ctypes.cdll.LoadLibrary   
lib = loadclib("/usr/lib/Neon/libNeon.so")  #Change lib here

DITrigger()
loop()




    


