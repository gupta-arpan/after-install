#!/bin/bash

# Updating package list
echo "Updating package lists..."
sudo dnf update

# Reboot system
echo "Rebooting system..."
sudo reboot



## Install and Configure git settings

# Installing git
echo "Installing git..."
sudo dnf -y install git

# Configuring git settings
echo "Configuring git settings..."
git config --global user.email "arpan6095@gmail.com"
git config --global user.name "gupta-arpan"
git config --global init.defaultBranch main



## Install nvidia drivers

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

# Rebooting system 
echo "Rebooting system..."
sudo reboot

# Checking whether the NVIDIA Drivers Are Working on Fedora
echo "Checking Whether the NVIDIA Drivers Are Working on Fedora..."
lsmod | grep nvidia
nvidia-smi


## Install Brave Browser
echo "Installing brave browser..."
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser brave-keyring


# Install Gnome Tweaks
echo "Installing gnome tweaks..."
sudo dnf install gnome-tweaks


# Install zsh
echo "Installing zsh..."
sudo dnf install zsh

# Set zsh as default terminal
echo "Setting zsh as default terminal..."
chsh -s $(which zsh)

# Set themes and plugins for zsh
echo "Installing and setting up plugins and themes..."
echo "Syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
echo "source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "Powerlevel10k theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
echo 'source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
echo "Auto suggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
echo 'source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >>~/.zshrc
echo "History substring"
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/zsh-history-substring-search
echo 'source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh' >>~/.zshrc
echo "Auto notify"
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git ~/.config/zsh/auto-notify
echo 'source ~/.config/zsh/auto-notify/auto-notify.plugin.zsh' >>~/.zshrc

# End of the script
