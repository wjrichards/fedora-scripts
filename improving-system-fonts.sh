#!/bin/bash

echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
echo '#         Improving System Fonts            #'
echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
sleep 2

read -p 'Press [Enter] Key To Start'
sleep 2

# Installing freetype-freeworld package
echo '---------Installing freetype-freeworld package---------'
sleep 2
echo '------Supply Root Password------'
sudo yum install freetype-freeworld

# Setting the hinting style and enable RGB anti-aliasing
echo '---------Setting the hinting style and enable RGB anti-aliasing.---------'
sleep 2
gsettings "set" "org.gnome.settings-daemon.plugins.xsettings" "hinting" "slight"
gsettings "set" "org.gnome.settings-daemon.plugins.xsettings" "antialiasing" "rgba"

# Activate the lcddefault lcdfilter
echo '---------Activate the lcddefault lcdfilter---------'
sleep 2
echo 'Xft.lcdfilter: lcddefault' > ~/.Xresources

# Restart System
echo '---------Restart System---------'
sleep 2
exit $?
