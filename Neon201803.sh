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
# waterfox-kde  #
#################
apt-get --yes install waterfox-kde

#############
# Internet  #
# KGet      #
# KTorrent  #
# KMail     #
#############

# KGet
apt-get --force-yes install kget
# KTorrent
apt-get --force-yes install ktorrent
# KMail
apt-get --force-yes install kmail

##################
# Sys utilities: #
# Filelight      #
# KCalc          #
##################
# Filelight
apt-get --yes install filelight
# Kcalc
apt-get --yes install kcalc

##################
# Entertainment: #
# Handbrake      #
# Yakuake        #
# Kolourpaint    #
# KDenLive       #
# KMPlayer       #
##################

# handbrake
#apt-get --force-yes install handbrake-gtk handbrake-cli
# Guake
apt-get --force-yes install yakuake
# Kolourpaint
apt-get --force-yes install kolourpaint
# KDenLive
apt-get --force-yes install kdenlive
# KMPlayer
apt-get --force-yes install kmplayer


##################
# Drivers        #
##################


############
# Clean-up #
############



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
