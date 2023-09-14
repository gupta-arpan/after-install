#!/bin/bash

# Updating package list
echo "Updating package lists..."
sudo dnf update

# Reboot system
echo "Rebooting system..."
sudo reboot



## Istalling and Configuring git settings

# Installing git
echo "Installing git..."
sudo dnf -y install git

# Configuring git settings
echo "Configuring git settings..."
git config --global user.email "arpan6095@gmail.com"
git config --global user.name "gupta-arpan"
git config --global init.defaultBranch main



## Installing nvidia drivers

# Checking if NVIDIA GPU is installed in computer
echo "Checking if NVIDIA GPU is installed in computer..."
lspci | grep -Ei 'VGA|3D'

#Installing the Kernel Headers and Development Libraries on Fedora Workstation 38
echo "Installing the Kernel Headers and Development Libraries on Fedora Workstation 38"
echo "Press Y and then Enter every time..."
sudo dnf install kernel-headers kernel-devel dkms

# Enabling the RPM Fusion Repositories on Fedora
echo "Enabling the RPM Fusion Repositories on Fedora..."
echo "Press Y and then Enter every time..."
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# Updating the Fedora Package Repository Cache
echo "Updating the Fedora Package Repository Cache..."
sudo dnf makecache

# Installing the NVIDIA Drivers on Fedora Workstation 38 from RPM Fusion Repository
echo "Installing the NVIDIA Drivers on Fedora Workstation 38 from RPM Fusion Repository..."
echo "Press Y and then Enter every time..."
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda

# Reboot system 
echo "Rebooting system..."
sudo reboot

# Checking Whether the NVIDIA Drivers Are Working on Fedora
echo "Checking Whether the NVIDIA Drivers Are Working on Fedora..."
lsmod | grep nvidia
nvidia-smi


## Installing brave browser
echo "Installing brave browser..."
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser brave-keyring
# End of the script
