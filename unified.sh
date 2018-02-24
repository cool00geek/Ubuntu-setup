#!/bin/bash

#########################################
# This is licensed under the MPL-V2     #
# Check the LICENSE file for more info! #
#########################################

apt-get install curl
#################
# REPOSITORIES: #
# Webupd8       #
# Fingerprint   #
# Waterfox      #
# Dolphin       #
# Fish          #
# Itch.io       #
# Thunderbird   #
# GIMP          #
# Rclone browser#
# GFX           #
# Google Chrome #
# Touchpad indi #
#################

echo "Setting up repositories"
# Webupd8
add-apt-repository ppa:nilarimogard/webupd8
# Wine
sudo dpkg --add-architecture i386 
wget https://dl.winehq.org/wine-builds/Release.key
apt-key add Release.key
apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
rm Release.key
# Waterfox
echo "deb https://dl.bintray.com/hawkeye116477/waterfox-deb release main" | tee -a /etc/apt/sources.list
curl https://bintray.com/user/downloadSubjectPublicKey?username=hawkeye116477 | apt-key add -
# Dolphin
add-apt-repository ppa:dolphin-emu/ppa
# Fish
sudo apt-add-repository ppa:fish-shell/release-2
# Itch.io
curl https://dl.itch.ovh/archive.key | apt-key add -
echo "deb https://dl.bintray.com/itchio/deb xenial main" | sudo tee /etc/apt/sources.list.d/itchio.list
# Thunderbird
add-apt-repository ppa:mozillateam/thunderbird-next
# Gimp
add-apt-repository ppa:otto-kesselgulasch/gimp
# Rclone browser
#add-apt-repository ppa:mmozeiko/rclone-browser
# GFX
wget https://download.01.org/gfx/RPM-GPG-GROUP-KEY-ilg
apt-key add RPM-GPG-GROUP-KEY-ilg
rm RPM-GPG-GROUP-KEY-ilg
# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
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
# Waterfox      #
# Albert        #
# Chrome        #
# KeeWeb        #
# Synergy       #
#################

# Waterfox
apt-get --force-yes install waterfox
# Albert
apt-get --force-yes install albert
sudo -u $SUDO_USER cp Configs/albert.conf $HOME/.config/albert.conf
# Chrome
apt-get --force-yes install google-chrome-stable
# KeeWeb
wget https://github.com/keeweb/keeweb/releases/download/v1.5.6/KeeWeb-1.5.6.linux.x64.deb
dpkg -i KeeWeb-1.5.6.linux.x64.deb
apt-get --force-yes install -f
rm KeeWeb-1.5.6.linux.x64.deb
# Synergy
apt-get --force-yes install synergy

##################
# Dev:           #
# Ubuntu make    #
# VS Code        #
# Git            #
# Umake          #
# Android        #
# IDEA           #
# Netbeans       #
# Pip            #
# Pip3           #
# Tkinter        #
# Ruby/ruby-dev  #
# FPM            #
##################
# Ubuntu make
apt-get --force-yes install ubuntu-make
# Visual studio code
umake ide visual-studio-code
# Git
apt-get --force-yes install git
# Android studio
umake android android-studio --accept-license
# IDEA
#umake ide idea
umake ide idea-ultimate
# Netbeans
# Pip
apt-get --force-yes install python-pip
# pip 3
apt-get --force-yes install python3-pip
# Tkinter
apt-get --force-yes install python-tk
# Ruby
apt-get --force-yes install ruby
apt-get --force-yes install ruby-dev
# FPM
gem install fpm

##################
# Entertainment: #
# Steam          #
# VLC            #
# Gimp           #
# itch.io        #
# Franz (Rambox?)#
# Hangups        #
# Dolphin        #
# Variety        #
##################
# Steam
apt-get --force-yes install steam
# VLC
apt-get --force-yes install vlc
# gimp
apt-get --force-yes install gimp
# itch.io

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
# Rambox
#wget "https://getrambox.herokuapp.com/download/linux_64?filetype=deb" -O rambox.tar.xz
#mkdir rambox
#tar -xf rambox.tar.xz -C rambox
# Hangups
pip3 install hangups
# Dolphin
apt-get --force-yes install dolphin-emu-master
# Variety 
apt-get --force-yes install variety

###############
# Shell:      #
# Tmux        #
# Fish        #
# Teleconsole #
# Guake       #
###############
# Tmux
apt-get --force-yes install tmux
# Fish
apt-get --force-yes install fish
# Teleconsole
curl https://www.teleconsole.com/get.sh | sh
# Guake
apt-get --force-yes install guake

##################
# Drivers        #
# Brother HL2240 #
# TLP            #
# Displaylink    #
# BTRFS          #
# EXFat          #
# Solaar         #
# Touchpad indic #
##################
# Brother HL2240
wget http://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.1.1-1.gz
gunzip linux-brprinter-installer-2.1.1-1.gz
chmod +x linux-brprinter-installer-2.1.1-1
./linux-brprinter-installer-2.1.1-1
rm linux-brprinter-installer-2.1.1-1
# TLP
apt-get --force-yes install tlp
cp Configs/tlp /etc/default/tlp
# DisplayLink
echo "Download this: http://www.displaylink.com/downloads/file?id=993 and run"
sleep 10
# BTRFS
apt-get --force-yes install btrfs-tools
# Exfat
apt-get --force-yes install exfat-utils exfat-fuse
# Solaar
apt-get install solaar
# Touchpad indicator
apt-get install touchpad-indicator

#########
# Theme #
#########
wget https://github.com/LinxGem33/OSX-Arc-Darker/releases/download/v1.4.3/osx-arc-collection_1.4.3_amd64.deb
dpkg -i osx-arc-collection_1.4.3_amd64.deb
apt-get --force-yes install -f
rm osx-arc-collection_1.4.3_amd64.deb


##########
# Config #
##########

# Fish
sudo -u $SUDO_USER mkdir $HOME/.config/fish
sudo -u $SUDO_USER cp Configs/config.fish $HOME/.config/fish/config.fish
sudo -u $SUDO_USER cp Configs/gh_complete.sh $HOME/.config/fish/gh_complete.sh
sudo -u $SUDO_USER mkdir $HOME/.config/fish/functions
sudo -u $SUDO_USER cp Configs/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish

# Tmux
sudo -u $SUDO_USER cp Configs/tmux.conf $HOME/.tmux.conf
sudo -u $SUDO_USER cp Configs/tmux.conf.local $HOME/.tmux.conf.local
sudo -u $SUDO_USER cp --recursive Configs/tmux $HOME/.tmux

# Shell
chsh -s /usr/bin/tmux $SUDO_USER

# OS Switch
cp "SwitchToWindows/Switch to Windows.desktop" "/usr/share/applications/Switch to Windows.desktop"
chmod +x "/usr/share/applications/Switch to Windows.desktop"
cp "SwitchToWindows/windowsStartup.py" "/usr/local/bin/windowsStartup.py"
cp "SwitchToWindows/bootWindows.sh" "/usr/local/bin/bootWindows"
cp "SwitchToWindows/startup.sh" "/usr/local/bin/refindStartup"
chattr +i "/usr/local/bin/windowsStartup.py"
chattr +i "/usr/local/bin/bootWindows"
chattr +i "/usr/local/bin/refindStartup"
echo "@reboot root /usr/local/bin/refindStartup" >> /etc/crontab

# Show username
gsettings set com.canonical.indicator.session show-real-name-on-panel true

#############
# Git repos #
#############
mkdir /usr/share/icons/SuperMato
git clone --recursive https://github.com/billwi/SuperMato.git /usr/share/icons/SuperMato

# VNC
# gnome-terminal --title 'VNC Server Licensing - sudo password required' --disable-factory -x sudo '/usr/bin/vnclicensewiz' '--helper'