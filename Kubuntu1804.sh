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
chmod +x Neon201803.sh
./Neon201803.sh

############
# Clean-up #
# VLC      #
# Muon     #
############

# VLC
apt-get --force-yes purge vlc*
# Muon
apt-get --force-yes purge muon*
