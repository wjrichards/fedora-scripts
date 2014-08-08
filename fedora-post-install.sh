#!/bin/bash

echo ''
echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
echo '#         Fedora Post-Install Script        #'
echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
sleep 2

read -p 'Press [Enter] Key To Start'
sleep 1

echo  'This May Take A While...Grab a Coffee & Relax!'
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


# CLEANING YUM CACHE
echo '------Almost Finished...Cleaning Apt Cache------'
sleep 2
sudo yum clean all

sleep 2
echo '#------FINISHED------#'
echo -e '\033[0m'

exit $?
