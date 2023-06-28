#!/usr/bin/bash

sudo apt update && sudo apt upgrade -yy

sudo apt install -yy git wget curl zip unzip zsh \
kitty neovim lf bat poppler-utils sxiv mpv mpd \
gcc g++ python3 python3-pip make cmake

## GUI Packages ##
read -n1 -rep 'Would you like to install GUI packages? [y/n]' GUI
if [[ $GUI == "Y" || $GUI == "y" ]]; then
  sudo apt install -yy xorg xserver-xorg picom xwallpaper maim \
  libxft-dev libx11-dev libxinerama-dev libxcb1-dev libxrandr-dev
  git clone https://github.com/sumit-modak/dwm $HOME/.local/src/dwm
  cd $HOME/.local/src/dwm && sudo make clean install
  cd $HOME/.local/src/dmenu && sudo make clean install
  cd $HOME/.local/src/slock && sudo make clean install
  cd $HOME/.local/src/slstatus && sudo make clean install
fi

## Virtualization Packages ##
read -n1 -rep 'Would you like to install virtualization packages? [y/n]' VIRT
if [[ $VIRT == "Y" || $VIRT == "y" ]]; then
  sudo apt install -yy qemu-utils qemu-system-x86 qemu-system-gui virt-manager bridge-utils
  sudo useradd -G $USER libvirt
  sudo useradd -G $USER libvirt-kvm
  sudo systemctl enable libvirtd.service
  sudo systemctl start libvirtd.service
fi

## Brave Browser ##
read -n1 -rep 'Would you like to install Brave Browser? [y/n]' BRO
if [[ $BRO == "Y" || $BRO == "y" ]]; then
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  sudo apt update
  sudo apt install -yy brave-browser
fi

# pip install openai

chsh -s /usr/bin/zsh

cd 