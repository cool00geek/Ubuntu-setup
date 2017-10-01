# This code is an example for a tutorial on Ubuntu Unity/Gnome AppIndicators:
# http://candidtim.github.io/appindicator/2014/09/13/ubuntu-appindicator-step-by-step.html

import os
import signal
import json

from gi.repository import Gtk as gtk
from gi.repository import AppIndicator3 as appindicator
from gi.repository import Notify as notify


APPINDICATOR_ID = 'KBCmdMap'

def main():
    indicator = appindicator.Indicator.new(APPINDICATOR_ID, os.path.abspath('/usr/share/icons/SuperMato/status/indicator-keyboard.svg'), appindicator.IndicatorCategory.SYSTEM_SERVICES)
    indicator.set_status(appindicator.IndicatorStatus.ACTIVE)
    indicator.set_menu(build_menu())
    notify.init(APPINDICATOR_ID)
    gtk.main()

def build_menu():
    menu = gtk.Menu()
    item_swap = gtk.MenuItem('Swap Alt and Super')
    item_swap.connect('activate', swap)
    menu.append(item_swap)
    item_unswap = gtk.MenuItem('Reset to normal layout')
    item_unswap.connect('activate', unswap)
    menu.append(item_unswap)
    item_quit = gtk.MenuItem('Quit')
    item_quit.connect('activate', quit)
    menu.append(item_quit)
    menu.show_all()
    return menu

def swap(_):
    os.system("setxkbmap -option altwin:swap_alt_win")
    notify.Notification.new("<b>Keyboard Layout</b>", "Alt and Super have been swapped!", None).show()

def unswap(_):
    os.system("setxkbmap -option")
    notify.Notification.new("<b>Keyboard Layout</b>", "Keyboard layout restored!", None).show()

def quit(_):
    notify.uninit()
    gtk.main_quit()

if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal.SIG_DFL)
main()
