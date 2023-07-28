#!/usr/bin/bash

sudo dnf copr enable varlad/helix
sudo dnf copr enable pennbauman/ports
sudo dnf update -y

sudo dnf install -yy zsh lf helix \
clang rust-all g++ python3 python3-pip cmake

## Standard System Packages ##
read -n1 -rep 'Would you like to install standard system utilities? [y/n]' SYS
if [[ $SYS == "Y" || $SYS == "y" ]]; then
  sudo dnf install -yy sudo man zip unzip patch curl wget \
  network-manager brightnessctl psmisc bat exa imagemagick
fi

## Sound Controls and Utilities ##
read -n1 -rep 'Would you like to install sound controls & utilities? [y/n]' SOUND
if [[ $SOUND == "Y" || $SOUND == "y" ]]; then
  sudo dnf install -yy pipewire wireplumber pipewire-pulse \
  pulseaudio-utils pavucontrol
  systemctl --user --now enable pipewire.service
  systemctl --user --now enable pipewire-pulse.service
  systemctl --user --now enable wireplumber.service
fi

## GUI Packages ##
read -n1 -rep 'Would you like to install GUI packages? [y/n]' GUI
if [[ $GUI == "Y" || $GUI == "y" ]]; then
  sudo dnf copr enable linuxredneck/xwallpaper
  sudo dnf install -yy @base-x picom xwallpaper maim gcc make \
  libxft-devel libx11-devel libxinerama-devel libxcb1-devel libxrandr-devel \
  kitty sxiv mpv mpd fontawesome-fonts
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

## Virtualization Packages ##
read -n1 -rep 'Would you like to install virtualization packages? [y/n]' VIRT
if [[ $VIRT == "Y" || $VIRT == "y" ]]; then
  sudo dnf install -yy @virtualization
  sudo useradd -G $USER libvirt
  sudo useradd -G $USER libvirt-kvm
  sudo systemctl enable libvirtd.service
  sudo systemctl start libvirtd.service
fi

## Brave Browser ##
read -n1 -rep 'Would you like to install Brave Browser? [y/n]' BROW
if [[ $BROW == "Y" || $BROW == "y" ]]; then
  sudo dnf install dnf-plugins-core
  sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
  sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
  sudo dnf install brave-browser brave-keyring
fi

## GIMP ##
read -n1 -rep 'Would you like to install GIMP? [y/n]' GIMP
if [[ $GIMP == "Y" || $GIMP == "y" ]]; then
  sudo dnf install -yy gimp
fi

## LibreOffice ##
read -n1 -rep 'Would you like to install LibreOffice? [y/n]' OFFICE
if [[ $OFFICE == "Y" || $OFFICE == "y" ]]; then
  sudo dnf install -yy libreoffice
fi

## System Utilities ##
read -n1 -rep 'Would you like to install random CLI system utilities? [y/n]' UTIL
if [[ $UTIL == "Y" || $UTIL == "y" ]]; then
  sudo dnf install -yy htop cmatrix neofetch figlet \
  espeak-ng yt-dlp ncdu bpytop btop
fi

# pip install openai

chsh -s /usr/bin/zsh

sudo reboot
