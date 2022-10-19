#!/bin/bash

echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
echo '#         Fedora Post-Install Script        #'
echo '#-------------------------------------------#'
echo '#-------------------------------------------#'
sleep 2

read -p 'Press [Enter] To Start'
sleep 2

# Enable the fastest mirror
sleep 2
echo 'fastestmirror=true' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=5' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf
cat /etc/dnf/dnf.conf

# Updating System Sources
echo '-------Updating System------'
sleep 2
sudo dnf update -y

# Installing Third Party Repositories
echo '------ Installing RPM Fusion ------'
sleep 2
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

echo '------ Installing App-Stream Meta-data ------'
sleep 2
sudo dnf groupupdate core -y

echo '------ Installing Nvidia Drivers $ Dependencies ------'
sleep 2
sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora36/x86_64/cuda-fedora36.repo
sudo dnf install kernel-headers kernel-devel tar bzip2 make automake gcc gcc-c++ pciutils elfutils-libelf-devel libglvnd-opengl libglvnd-glx libglvnd-devel acpid pkgconfig dkms
sudo dnf module install nvidia-driver:latest-dkms

# Installing Favorite Apps
echo '------Installing Brave Browser------'
sleep 2
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

echo '------Installing Design & Production Apps------'
sleep 2
sudo dnf install inkscape gimp

echo '------Installing Development Apps & Dependencies------'
sleep 2
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code

echo '------Installing GNOME Extras------'
sleep 2
sudo dnf install gnome-music epiphany

# Cleaning Cache
echo '------Almost Done, Cleaning dnf Cache------'
sleep 2
sudo dnf upgrade --refresh
sudo dnf check
sudo dnf autoremove
sudo sudo dnf update

echo '#------FINISHED------#'
sleep 2
exit $?
