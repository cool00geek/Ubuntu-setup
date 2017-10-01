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
# Thunderbird   #
# GIMP          #
# Rclone browser#
# GFX           #
# Google Chrome #
#################

echo "Setting up repositories"
# Webupd8
add-apt-repository ppa:nilarimogard/webupd8
# Wine
add-apt-repository ppa:wine/wine-builds
# Recent notifications
add-apt-repository ppa:jconti/recent-notifications
# Handbrake
add-apt-repository ppa:stebbins/handbrake-releases
# Fingerprint
add-apt-repository ppa:fingerprint/fingerprint-gui
# Waterfox
echo "deb https://hawkeye116477.github.io/waterfox-deb release main" | tee /etc/apt/sources.list.d/waterfox-release-hawkeye116477.list
curl https://hawkeye116477.github.io/waterfox-deb/hawkeye116477.key | apt-key add -
rm hawkeye116477.key
# Dolphin
add-apt-repository ppa:dolphin-emu/ppa
# Itch.io
curl https://dl.itch.ovh/archive.key | apt-key add -
rm archive.key
echo "deb https://dl.bintray.com/itchio/deb xenial main" | sudo tee /etc/apt/sources.list.d/itchio.list
# Caffeine
add-apt-repository ppa:caffeine-developers/ppa
# Ubuntu make
add-apt-repository ppa:ubuntu-desktop/ubuntu-make
# Thunderbird
add-apt-repository ppa:mozillateam/thunderbird-next
# Gimp
add-apt-repository ppa:otto-kesselgulasch/gimp
# Rclone browser
add-apt-repository ppa:mmozeiko/rclone-browser
# GFX
wget https://download.01.org/gfx/RPM-GPG-GROUP-KEY-ilg
apt-key add RPM-GPG-GROUP-KEY-ilg
rm RPM-GPG-GROUP-KEY-ilg
# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
rm linux_signing_key.pub
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
# Chrome        #
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
sudo -u $SUDO_USER "cp albert.conf $HOME/.config/albert.conf"
# Unity tweak tool
apt-get install unity-tweak-tool
# Chrome
sudo apt-get install google-chrome-stable
# qpdfview
apt-get install qpdfview
# libinput
apt-get install xserver-xorg-input-libinput
rm /usr/share/X11/xorg.conf.d/90-libinput.conf
cp Configs/90-libinput.conf /usr/share/X11/xorg.conf.d/90-libinput.conf
# Caffeine
apt-get install caffeine
# KeeWeb
wget -O https://github.com/keeweb/keeweb/releases/download/v1.5.4/KeeWeb-1.5.4.linux.x64.deb keeweb.deb
dpkg -i keeweb.deb
apt-get install -f
rm keeweb.deb
# Synergy
apt-get install synergy

##################
# Dev:           #
# VS Code        #
# Git            #
# Arduino        #
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
#umake ide idea
umake ide idea-ultimate
# Netbeans
# Pip
apt-get install python-pip
# pip 3
apt-get install python3-pip
# Tkinter
apt-get install python-tk
# Ruby
apt-get install ruby
apt-get install ruby-dev
# FPM
gem install fpm

##################
# Sys utilities: #
# Gparted        #
# ARandR         #
# Fingerprint    #
# keylock        #
# VMWare         #
# WINE           #
# Diskman        #
# Shutter        #
# Sysmon         #
# Rclone         #
# Rclone browser #
# Cloudprint     #
# net-tools      #
# Keeweb         #
# Super alt swap #
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
echo "Install this: https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-12.5.7-5813279.x86_64.bundle"
echo "Use this key: FV3TR-4RWEM-4805P-6WYEV-QF292"
sleep 10
# Wine
apt-get install --install-recommends winehq-devel
apt-get install winbind
apt-get install winetricks
# Diskman
apt-get install indicator-diskman
# Shutter
apt-get install shutter
# indicator sysmon
apt-get install indicator-sysmonitor
# Rclone
snap install rclone --classic
# Rclone browser
apt-get install rclone-browser
# Cloudprint
apt-get install google-cloud-print-connector
wget https://raw.githubusercontent.com/google/cloud-print-connector/master/systemd/cloud-print-connector.service
install -o root -m 0664 cloud-print-connector.service /etc/systemd/system
systemctl enable cloud-print-connector.service
systemctl start cloud-print-connector.service
# Net-tools
apt-get install net-tools
# Keeweb
wget https://github.com/keeweb/keeweb/releases/download/v1.5.6/KeeWeb-1.5.6.linux.x64.deb
dpkg -i KeeWeb-1.5.6.linux.x64.deb
# Super alt swap
cp Configs/appleKeyboardLayoutIndicator.py /usr/bin/appleKeyboardLayoutIndicator.py
sudo -u "$SUDO_USER" cp Configs/disable_super_key.py.desktop $HOME/.config/autostart

##################
# Entertainment: #
# Steam          #
# VLC            #
# Gimp           #
# itch.io        #
# Handbrake      #
# Franz (Rambox?)#
# Dolphin        #
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
rm Franz-linux-x64-4.0.4.tgz
# Rambox
#wget "https://getrambox.herokuapp.com/download/linux_64?filetype=deb" -O rambox.tar.xz
#mkdir rambox
#tar -xf rambox.tar.xz -C rambox
# Dolphin
apt-get install dolphin-emu-master
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
rm get.sh

##################
# Drivers        #
# Brother HL2240 #
# Intel 4400 HD  #
# TLP            #
# Displaylink    #
# BTRFS          #
# EXFat          #
##################
# Brother HL2240
wget -O http://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.1.1-1.gz
gunzip linux-brprinter-installer-2.1.1-1.gz
chmod +x linux-brprinter-installer-2.1.1-1
./linux-brprinter-installer-2.1.1-1
rm linux-brprinter-installer-2.1.1-1
# Intel 4400 HD
wget -O https://download.01.org/gfx/ubuntu/17.04/main/pool/main/i/intel-graphics-update-tool/intel-graphics-update-tool_2.0.5_amd64.deb intel.deb
dpkg -i intel.deb
apt-get install -f
rm intel.deb
# TLP
apt-get install tlp
cp Configs/tlp /etc/default/tlp
# DisplayLink
echo "Download this: http://www.displaylink.com/downloads/file?id=993 and run"
sleep 10
# BTRFS
apt-get install btrfs-tools
# Exfat
exfat-utils exfat-fuse

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
# Gnome-mines
apt-get purge gnome-mines
# Aisleriot
apt-get purge aisleriot
# Shotwell
apt-get purge shotwell

#########
# Theme #
#########
wget https://github.com/LinxGem33/OSX-Arc-Darker/releases/download/v1.4.3/osx-arc-collection_1.4.3_amd64.deb
sudo dpkg -i osx-arc-collection_1.4.3_amd64.deb
rm osx-arc-collection_1.4.3_amd64.deb
gsettings set org.gnome.desktop.interface gtk-theme "Arc-darker-osx"

##########
# Config #
##########

# Fish
cp Configs/config.fish $HOME/.config/fish/config.fish
cp Configs/gh_complete.sh $HOME/.config/fish/gh_complete.sh
mkdir $HOME/.config/fish/functions
cp Configs/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish

# Tmux
cp Configs/tmux.conf $HOME/.tmux.conf

# Shell
chsh -s /usr/bin/tmux $SUDO_USER

# OS Switch
cp "SwitchToWindows/Switch to Windows.desktop" "/usr/share/applications/Switch to Windows.desktop"
cp "SwitchToWindows/windowsStartup.py" "/usr/local/bin/windowsStartup.py"
cp "SwitchToWindows/bootWindows.sh" "/usr/local/bin/bootWindows"
cp "SwitchToWindows/startup.sh" "/usr/local/bin/refindStartup"
chattr +i "/usr/local/bin/windowsStartup.py"
chattr +i "/usr/local/bin/bootWindows"
chattr +i "/usr/local/bin/startup"
echo "@reboot root /usr/local/bin/refindStartup" >> /etc/crontab

# IPTables
cp Configs/iptables_rules /etc/iptables_rules
echo "@reboot root /bin/bash -c \"/sbin/iptables-restore < /etc/iptables_rules\"" >> /etc/crontab

#############
# Git repos #
#############
mkdir /usr/share/icons/SuperMato
git clone --recursive https://github.com/billwi/SuperMato.git /usr/share/icons/SuperMato
gsettings set org.gnome.desktop.interface icon-theme 'Supermato'
