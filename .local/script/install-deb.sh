#!/usr/bin/bash

sudo apt update && sudo apt upgrade -yy

mkdir -p $HOME/multimedia/screenshots
sudo cp $HOME/.local/share/fonts /usr/share

sudo apt install -yy zsh lf \
clang g++ python3 python3-pip cmake

## Standard System Packages ##
read -n1 -rep 'Would you like to install standard system utilities? [y/n]' SYS
if [[ $SYS == "Y" || $SYS == "y" ]]; then
  sudo apt install -yy sudo man zip unzip patch curl wget unrar \
  network-manager brightnessctl psmisc bat exa imagemagick
fi

## Sound Controls and Utilities ##
read -n1 -rep 'Would you like to install sound controls & utilities? [y/n]' SOUND
if [[ $SOUND == "Y" || $SOUND == "y" ]]; then
  sudo apt install -yy pipewire wireplumber pipewire-pulse \
  pulseaudio-utils pavucontrol
  systemctl --user --now enable pipewire.service
  systemctl --user --now enable pipewire-pulse.service
  systemctl --user --now enable wireplumber.service
fi

## GUI Packages ##
read -n1 -rep 'Would you like to install GUI packages? [y/n]' GUI
if [[ $GUI == "Y" || $GUI == "y" ]]; then
  sudo apt install -yy xorg xserver-xorg picom xwallpaper maim \
  libxft-dev libx11-dev libxinerama-dev libxcb1-dev libxrandr-dev \
  kitty sxiv mpv mpd gcc make fonts-font-awesome xclip
  git clone https://github.com/sumit-modak/dwm $HOME/.local/src/dwm
  cd $HOME/.local/src/dwm && sudo make clean install
  cd $HOME/.local/src/dmenu && sudo make clean install
  cd $HOME/.local/src/slock && sudo make clean install
  cd $HOME/.local/src/slstatus && sudo make clean install
fi

## Theme ##
read -n1 -rep 'Would you like to install nordic theme? [y/n]' THEME
if [[ $THEME == "Y" || $THEME == "y" ]]; then
  cd /usr/share/themes
  git clone --depth=1 https://github.com/EliverLara/Nordic.git
fi

## Brave Browser ##
read -n1 -rep 'Would you like to install Brave Browser? [y/n]' BROW
if [[ $BROW == "Y" || $BROW == "y" ]]; then
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" \
    | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  sudo apt update && sudo apt install -yy brave-browser
fi

## Virtualization Packages ##
read -n1 -rep 'Would you like to install virtualization packages? [y/n]' VIRT
if [[ $VIRT == "Y" || $VIRT == "y" ]]; then
  sudo apt install -yy qemu-utils qemu-system-x86 qemu-system-gui \
  virt-manager libvirt-dev bridge-utils
  sudo useradd -G $USER libvirt
  sudo useradd -G $USER libvirt-kvm
  sudo systemctl enable libvirtd.service
  sudo systemctl start libvirtd.service
fi

## TablePlus ##
read -n1 -rep 'Would you like to install TablePlus? [y/n]' TABLEPLUS
if [[ $TABLEPLUS == "Y" || $TABLEPLUS == "y" ]]; then
  wget -qO - https://deb.tableplus.com/apt.tableplus.com.gpg.key \
    | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/tableplus-archive.gpg > /dev/null
  sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian/22 tableplus main"
  sudo apt update
  sudo apt install tableplus
fi

## VSCodium ##
read -n1 -rep 'Would you like to install VSCodium? [y/n]' CODIUM
if [[ $CODIUM == "Y" || $CODIUM == "y" ]]; then
  wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
  echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
  sudo apt update && sudo apt install -yy codium
fi

## GIMP ##
read -n1 -rep 'Would you like to install GIMP? [y/n]' GIMP
if [[ $GIMP == "Y" || $GIMP == "y" ]]; then
  sudo apt install -yy gimp
fi

## LibreOffice ##
read -n1 -rep 'Would you like to install LibreOffice? [y/n]' OFFICE
if [[ $OFFICE == "Y" || $OFFICE == "y" ]]; then
  sudo apt install -yy libreoffice
fi

read -n1 -rep 'Would you like to install helix? [y/n]' FP
if [[ $FP == "Y" || $FP == "y" ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  git clone https://github.com/helix-editor/helix ~/.local/src/helix/
  cd ~/.local/src/helix
fi

## System Utilities ##
read -n1 -rep 'Would you like to install random CLI system utilities? [y/n]' UTIL
if [[ $UTIL == "Y" || $UTIL == "y" ]]; then
  sudo apt install -yy htop cmatrix neofetch figlet \
  espeak-ng yt-dlp ncdu bpytop btop
fi

# pip install openai

chsh -s /usr/bin/zsh

sudo reboot
