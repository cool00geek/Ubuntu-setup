#!/bin/bash

#########################################
# This is licensed under the MPL-V2     #
# Check the LICENSE file for more info! #
#########################################


################################
# Notes!                       #
# Handbrake has no artful      #
#    -- Git version avail      #
# Rclone browser has no artful #
#    -- Github version avail   #
################################



###################
# Checking system #
###################

echo -n "Checking architecture... "
if uname -m | grep '64'
then
    echo "PASS"
else
    echo "FAIL! Re-run on a 64bit system!"
fi


echo -n "Checking permissions... "
if [[ $(id -u) -ne 0 ]]
then
    echo "FAIL! Running as sudo..."
    sudo ./"$0"
else
    echo "PASS!"
fi

chmod +x unified.sh
./unified.sh

#################
# REPOSITORIES: #
# Handbrake     #
#################

echo "Setting up repositories"
# Handbrake
#add-apt-repository ppa:stebbins/handbrake-releases
# Update
apt-get update
apt-get dist-upgrade


###########
# INSTALL #
###########

#################
# Requirements: #
# Gnome tweak   #
#################
# Gnome tweak tool
apt-get --force-yes install gnome-tweak-tool


##################
# Sys utilities: #
# Shell connector#
# Shutter        #
##################
# Shell connector
apt-get install chrome-gnome-shell
apt-get install gnome-shell-extensions
# Shutter
apt-get --force-yes install shutter

##################
# Entertainment: #
# Handbrake      #
# Guake          #
# VLC            #
##################

# handbrake
#apt-get --force-yes install handbrake-gtk handbrake-cli
# Guake
apt-get --force-yes install guake
# VLC
apt-get --force-yes install vlc


##################
# Drivers        #
##################


############
# Clean-up #
############
# Totem
apt-get --force-yes purge totem*
# Rhythmbox
apt-get --force-yes purge rhythmbox-*
# Firefox
apt-get --force-yes purge firefox
# Gnome-screenshot
apt-get --force-yes purge gnome-screenshot
# Apport
apt-get --force-yes purge apport
# Whoopsie
apt-get --force-yes purge whoopsie
# Zeitgeist
apt-get --force-yes purge zeitgeist-core
# Gnome-mines
apt-get --force-yes purge gnome-mines
# Aisleriot
apt-get --force-yes purge aisleriot
# Shotwell
apt-get --force-yes purge shotwell
# Libreoffice
apt-get --force-yes purge libreoffice-*
# Sudoku
apt-get --force-yes purge gnome-sudoku
# Mahjongg
apt-get --force-yes purge gnome-mahjongg


###############
# Gnome Shell #
###############


##########
# Config #
##########

# Windows controls on left
gsettings set org.gnome.desktop.wm.preferences button-layout close,minimize,maximize:


#############
# Git repos #
#############
mkdir /usr/share/icons/SuperMato
git clone --recursive https://github.com/cool00geek/SuperMato.git /usr/share/icons/SuperMato
