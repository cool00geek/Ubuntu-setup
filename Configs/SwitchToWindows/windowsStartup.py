#!/usr/bin/python

import Tkinter
from Tkinter import *
from PIL import ImageTk, Image
import os
import time

root = Tk()
frame = Frame(root)
root.wm_title("Switch to Windows")
frame.pack()

bottomframe = Frame(root)
bottomframe.pack( side = BOTTOM )

def shutdownPress():
    text.config(text = "Shutting down...")
    os.system("sudo /mnt/sd/Downloads/Software/Portable/BootOpts/bootWindows.sh")
    os.system("systemctl poweroff")
    root.update()

def restartPress():
    text.config(text = "Restarting...")
    os.system("sudo /mnt/sd/Downloads/Software/Portable/BootOpts/bootWindows.sh")
    os.system("systemctl reboot")
    root.update()

def cancelPress():
    quit()
    root.update()

text = Label(frame, text="Do you want to switch to Windows?")
text.pack( side = TOP)

redbutton = Button(frame, text="Restart", command=restartPress)
redbutton.pack( side = LEFT)

greenbutton = Button(frame, text="Shutdown", command=shutdownPress)
greenbutton.pack( side = LEFT )

bluebutton = Button(frame, text="Cancel", command=cancelPress)
bluebutton.pack( side = LEFT )


root.mainloop()
