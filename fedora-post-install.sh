#!/bin/bash

echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
echo '#         Fedora Post-Install Script        #'
echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
sleep 2

read -p 'Press [Enter] To Start'
sleep 1

echo '-------This May Take A While-------'
sleep 2

# INSTALLING PLUGINS
echo '-------Updating Sources------'
sleep 2
echo '------Supply Root Password------'
sudo yum install yum-plugin-fastestmirror -y

# UPDATE SOURCES & SYSTEM UPGRADE
echo '-------Updating Sources------'
sleep 2
sudo yum update -y

# INSTALLING THIRD PARTY REPOSITORIES
echo '------Installing RPM Fusion------'
sleep 2
sudo yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# ENABLING MP3 AND DVD PLAYBACKS
echo '------Installing Media Codecs------'
sleep 2
sudo yum install gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly gstreamer-ffmpeg ffmpeg mencoder ffmpeg2theora mplayer libdvdcss


# INSTALLING FAVOURITE APPS
echo '------Installing A LIST Of MY FAVOURITE APPS------'
sleep 2
sudo yum install chrome 

# CLEANING YUM CACHE
echo '------Almost Done, Cleaning Yum Cache------'
sleep 2
sudo yum clean all

sleep 2
echo '#------FINISHED------#'

exit $?
