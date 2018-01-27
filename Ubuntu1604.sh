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
# Rclone browser#
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
# Rclone browser
add-apt-repository ppa:mmozeiko/rclone-browser
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
# Gparted        #
# ARandR         #
# Fingerprint    #
# keylock        #
# VMWare         #
# WINE           #
# Shutter        #
# Sysmon         #
# Rclone         #
# Rclone browser #
# Cloudprint     #
# net-tools      #
# Super alt swap #
##################
# Gparted
apt-get --force-yes install gparted
# ARandR
apt-get --force-yes install arandr
# Fingerprint
apt-get --force-yes install libbsapi policykit-1-fingerprint-gui fingerprint-gui
# Keylock
apt-get --force-yes install indicator-keylock
# VMWare
echo "Install this: https://www.vmware.com/go/tryworkstation-linux-64"
echo "Use a key"
sleep 10
# Wine
apt-get --force-yes install --install-recommends winehq-devel
apt-get --force-yes install winbind
apt-get --force-yes install winetricks
# Shutter
apt-get --force-yes install shutter
# Rclone
snap install rclone --classic
# Rclone browser
apt-get install rclone-browser
# Cloudprint
apt-get --force-yes install google-cloud-print-connector
wget https://raw.githubusercontent.com/google/cloud-print-connector/master/systemd/cloud-print-connector.service
install -o root -m 0664 cloud-print-connector.service /etc/systemd/system
systemctl enable cloud-print-connector.service
systemctl start cloud-print-connector.service
# Net-tools
apt-get --force-yes install net-tools
# Super alt swap
cp Configs/appleKeyboardLayoutIndicator.py /usr/bin/appleKeyboardLayoutIndicator.py
sudo -u "$SUDO_USER" cp Configs/disable_super_key.py.desktop $HOME/.config/autostart

##################
# Entertainment: #
# Handbrake      #
##################
# handbrake
apt-get --force-yes install handbrake-gtk handbrake-cli


##################
# Drivers        #
# Intel 4400 HD  #
##################
# Intel 4400 HD
wget https://download.01.org/gfx/ubuntu/16.04/main/pool/main/i/intel-graphics-update-tool/intel-graphics-update-tool_2.0.2_amd64.deb
dpkg -i intel-graphics-update-tool_2.0.5_amd64.deb
apt-get --force-yes install -f
rm intel-graphics-update-tool_2.0.5_amd64.deb


###############
# OFFICE 2013 #
###############
echo "Set the Windows Version to Win 7"
WINEPREFIX=~/.wine/Office2013 WINEARCH=win32 winecfg
echo "Install msxml6 in additional components"
echo "Then set HKCU\Software\Wine\Direct3D\MaxVersionGL to 30002 in hex"
WINEPREFIX=~/.wine/Office2013 WINEARCH=win32 winetricks
echo "Install Office 2013 with this whenever you're ready:"
echo "WINEPREFIX=~/.wine/Office2013 WINEARCH=win32 wine ~/PathTo/Office2013Setup.x86.exe"

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



