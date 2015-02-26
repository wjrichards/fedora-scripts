#!/bin/bash

echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
echo '#         Fedora Post-Install Script        #'
echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
sleep 2

read -p 'Press [Enter] To Start'
sleep 2

# Installing Plugins
echo '-------Updating Sources------'
sleep 2
echo '------Supply Root Password------'
sudo yum install yum-plugin-fastestmirror -y

# Updating System Sources
echo '-------Updating System------'
sleep 2
sudo yum update -y

# Installing Third Party Repositories
echo '------Installing RPM Fusion------'
sleep 2
sudo yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

echo '------Installing RPM Fusion------'
sleep 2
sudo yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y


# Enabling MP3 & DVD Playbacks
echo '------Installing Media Codecs------'
sleep 2
sudo yum install gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly gstreamer-ffmpeg ffmpeg mencoder ffmpeg2theora mplayer libdvdcss

# Installing Favourite Apps
echo '------Installing Favourite Apps------'
sleep 2
sudo yum install chrome steam

echo '------Installing Media Apps------'
sleep 2
sudo yum install vlc

echo '------Installing Design & Production Apps------'
sleep 2
sudo yum install inkscape gimp

echo '------Installing Development Apps & Dependencies------'
sleep 2
sudo yum install git atom bracket

echo '------Installing GNOME Extras------'
sleep 2
sudo yum install gnome-music epiphany

# Cleaning Cache
echo '------Almost Done, Cleaning Yum Cache------'
sleep 2
sudo yum clean all

echo '#------FINISHED------#'
sleep 2
exit $?
