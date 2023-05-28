#!/usr/bin/bash

sudo dnf update -y
sudo dnf install git wget curl

# display render: x, compositor: picom
sudo dnf install @base-x picom

# terminal
sudo dnf install kitty

# text editor
sudo dnf copr enable varlad/helix
sudo dnf install helix

# file explorer
sudo dnf copr enable pennbauman/ports
sudo dnf install lf
sudo dnf install bat poppler-utils

# screenshot utility
sudo dnf install maim

# wallpaper application
sudo dnf copr enable linuxredneck/xwallpaper
sudo dnf install xwallpaper

# sound drivers, sound emulator
sudo dnf install pavucontrol
# for bluetooth : install pulseaudio-bluetooth

# shell
sudo dnf install zsh
chsh -s /usr/bin/zsh

# sxiv - image viewer
# mpv - video player
# mpd - music player
sudo dnf install sxiv mpv fontawesome-fonts

# compilers
sudo dnf install gcc g++ python3 python3-pip make cmake
pip install openai

mkdir -p .local/src/
cd .local/src/

# window manager, application launcher
git clone https://github.com/sumit-modak/dwm
git clone https://github.com/sumit-modak/dmenu
git clone https://github.com/sumit-modak/slock

# suckless software dependencies
sudo dnf install libX11-devel libXft-devel libXinerama-devel libXrandr-devel

cd ~/.local/src/dwm && sudo make clean install 
cd ~/.local/src/dmenu && sudo make clean install
cd ~/.local/src/slock && sudo make clean install

# Fonts installation
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
mkdir Hack FiraCode

cd Hack && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Hack.zip
unzip Hack.zip && rm Hack.zip && cd ..

cd FiraCode && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FiraCode.zip
unzip FiraCode.zip && rm FiraCode.zip && cd ..

cd JetBrainsMono && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/JetBrainsMono.zip
unzip JetBrainsMono.zip && rm JetBrainsMono.zip && cd ..
