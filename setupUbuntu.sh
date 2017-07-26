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
# Dolphin       #
# Itch.io       #
# Caffeine      #
# Ubuntu Make   #
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
# Dolphin
add-apt-repository ppa:dolphin-emu/ppa
# Itch.io
curl https://dl.itch.ovh/archive.key | apt-key add -
echo "deb https://dl.bintray.com/itchio/deb xenial main" | sudo tee /etc/apt/sources.list.d/itchio.list
# Caffeine
add-apt-repository ppa:caffeine-developers/ppa
# Ubuntu make
add-apt-repository ppa:ubuntu-desktop/ubuntu-make
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
# libinput      #
# Caffeine      #
# KeeWeb        #
# Synergy       #
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
# libinput
apt-get install xserver-xorg-input-libinput
# Caffeine
apt-get install caffeine
# KeeWeb
wget -O https://github.com/keeweb/keeweb/releases/download/v1.5.4/KeeWeb-1.5.4.linux.x64.deb keeweb.deb
dpkg -i keeweb.deb
apt-get install -f
# Synergy


############
# Dev:     #
# VS Code  #
# Git      #
# Arduino  #
# Umake    #
# Android  #
# IDEA     #
# Netbeans #
############
# Ubuntu make
apt-get install ubuntu-make
# Visual studio code
umake web visual-studio-code
# Git
apt-get install git
# Arduino
umake ide arduino
# Android studio
umake android --accept-license
# IDEA
umake ide idea
#umake ide idea-ultimate
# Netbeans

##################
# Sys utilities: #
# Gparted        #
# ARandR         #
# Fingerprint    #
# keylock        #
# VMWare         #
# Diskman        #
# Shutter        #
# Sysmon         #
##################
# Gparted
apt-get install gparted
# ARandR
apt-get install arandr
# Fingerprint
apt-get install libbsapi policykit-1-fingerprint-gui fingerprint-gui
# Keylock
apt-get install indicator-keylock
# VMWare
# Diskman
apt-get install indicator-diskman
# Shutter
apt-get install shutter
# indicator sysmon
apt-get install indicator-sysmonitor

##################
# Entertainment: #
# Steam          #
# VLC            #
# Gimp           #
# itch.io        #
# Handbrake      #
# Franz          #
# Dolphin        #
# GNU Paint      #
# Variety        #
##################
# Steam
apt-get install steam
# VLC
apt-get install vlc
# gimp
apt-get install gimp
# itch.io
# handbrake
apt-get install handbrake-gtk handbrake-cli
# Franz, adapted from https://gist.github.com/ruebenramirez/22234da93f08be65125cc45fc386c1cd
mkdir -p /opt/franz
wget -qO- https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz | tar xvz -C /opt/franz/
sudo bash -c "cat <<EOF > /usr/share/applications/franz.desktop                                                                 
[Desktop Entry]
Name=Franz
Comment=
Exec=/opt/franz/Franz
Icon=franz
Terminal=false
Type=Application
Categories=Messaging,Internet
EOF"
# Dolphin
apt-get install dolphin-emu-master
# GNU Paint
apt-get install gpaint
# Variety 
apt-get install variety

###############
# Shell:      #
# Tmux        #
# Fish        #
# Teleconsole #
###############
# Tmux
apt-get install tmux
# Fish
apt-get install fish
# Teleconsole
curl https://www.teleconsole.com/get.sh | sh

###############
# OFFICE 2013 #
###############


############
# Clean-up #
############
# Evince
apt-get purge evince
# Totem
apt-get purge totem*
# Rhythmbox
apt-get purge rhythmbox-*
# Firefox
apt-get purge firefox
# Gnome-screenshot
apt-get purge gnome-screenshot
# Empathy
apt-get purge empathy-*
# Apport
apt-get purge apport
# Dovecot
apt-get purge dovecot-*
# Whoopsie
apt-get purge whoopsie
# Zeitgeist
apt-get purge zeitgeist
apt-get purge zeitgeist-datahub


##########
# Config #
##########

# Fish
cp config.fish $HOME/.config/fish/config.fish
cp gh_complete.sh $HOME/.config/fish/gh_complete.sh
mkdir $HOME/.config/fish/functions
cp fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish

# Tmux
cp tmux.conf $HOME/.tmux.conf