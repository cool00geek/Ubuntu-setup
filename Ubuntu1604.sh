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

chmod +x unified.sh
./unified.sh

#################
# REPOSITORIES: #
# Notifications #
# Handbrake     #
# Caffeine      #
# Ubuntu Make   #
# Touchpad indi #
#################

echo "Setting up repositories"
# Recent notifications
add-apt-repository ppa:jconti/recent-notifications
# Handbrake
add-apt-repository ppa:stebbins/handbrake-releases
# Caffeine
add-apt-repository ppa:caffeine-developers/ppa
# Ubuntu make
add-apt-repository ppa:ubuntu-desktop/ubuntu-make
# Touchpad indicator
add-apt-repository ppa:atareao/atareao
# Update
apt-get update
apt-get dist-upgrade


###########
# INSTALL #
###########

#################
# Requirements: #
# Unity tweak   #
# Caffeine      #
#################

# Unity tweak tool
apt-get --force-yes install unity-tweak-tool
# Caffeine
apt-get --force-yes install caffeine


##################
# Sys utilities: #
# keylock        #
##################
# Keylock
apt-get --force-yes install indicator-keylock

##################
# Entertainment: #
# Handbrake      #
# Variety        #
# Guake          #
##################
# handbrake
apt-get --force-yes install handbrake-gtk handbrake-cli
# Variety 
apt-get --force-yes install variety
# Guake
apt-get --force-yes install guake


##################
# Drivers        #
# Intel 4400 HD  #
##################
# Intel 4400 HD
wget https://download.01.org/gfx/ubuntu/16.04/main/pool/main/i/intel-graphics-update-tool/intel-graphics-update-tool_2.0.2_amd64.deb
dpkg -i intel-graphics-update-tool_2.0.5_amd64.deb
apt-get --force-yes install -f
rm intel-graphics-update-tool_2.0.5_amd64.deb

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
# Empathy
apt-get --force-yes purge empathy-*
# Apport
apt-get --force-yes purge apport
# Dovecot
apt-get --force-yes purge dovecot-*
# Whoopsie
apt-get --force-yes purge whoopsie
# Zeitgeist
apt-get --force-yes purge zeitgeist
apt-get --force-yes purge zeitgeist-datahub
# Gnome-mines
apt-get --force-yes purge gnome-mines
# Aisleriot
apt-get --force-yes purge aisleriot
# Shotwell
apt-get --force-yes purge shotwell
# Libreoffice
apt-get --force-yes purge libreoffice-*

##########
# Config #
##########

# Show username
gsettings set com.canonical.indicator.session show-real-name-on-panel true

