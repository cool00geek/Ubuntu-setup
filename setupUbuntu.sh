#!/bin/bash

#########################################
# This is licensed under the MPL-V2     #
# Check the LICENSE file for more info! #
#########################################



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


#################
# REPOSITORIES: #
# Webupd8       #
# Notifications #
# Handbrake     #
# Fingerprint   #
# Waterfox      #
#################

echo "Setting up repositories"
# Webupd8
add-apt-repository ppa:nilarimogard/webupd8
# Wine
wget https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
# Recent notifications
add-apt-repository ppa:jconti/recent-notifications
# Handbrake
add-apt-repository ppa:stebbins/handbrake-releases
# Fingerprint
add-apt-repository ppa:fingerprint/fingerprint-gui
# Waterfox
echo "deb https://hawkeye116477.github.io/waterfox-deb release main" | tee /etc/apt/sources.list.d/waterfox-release-hawkeye116477.list
curl https://hawkeye116477.github.io/waterfox-deb/hawkeye116477.key | apt-key add -
# Update
apt-get update


###########
# INSTALL #
###########

#################
# Requirements: #
# Waterfox      #
# Albert        #
# Unity tweak   #
# Chromium      #
# qpdfview      #
#################
# Waterfox
apt-get install waterfox
# Albert
apt-get install albert
# Unity tweak tool
apt-get install unity-tweak-tool
# Chromium
apt-get install chromium-browser
# qpdfview
apt-get install qpdfview

############
# Dev:     #
# VS Code  #
# Git      #
############
# Visual studio code
curl -J -L "https://go.microsoft.com/fwlink/?LinkID=760868" "code.deb"
dpkg -i code.deb
# Git
apt-get install git

##################
# Sys utilities: #
# Gparted        #
##################
# Gparted
apt-get install gparted