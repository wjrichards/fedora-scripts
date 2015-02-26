#!/bin/bash

echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
echo '#            Installing SASS                #'
echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
sleep 2

read -p 'Press [Enter] Key To Start'
sleep 2

# Installing Dependencies
echo '-------Installing Ruby and other Dependenties------'
sudo dnf install ruby nodejs git
sleep 2

# Installing Sass & Others
echo '-------Installing Sass------'
gem install sass
sleep 2

echo '-------Installing Compass------'
gem install compass
sleep 2

echo '-------Installing foundation------'
gem install foundation
sleep 2
