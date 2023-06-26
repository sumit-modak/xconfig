#!/usr/bin/bash

sudo dnf update -y
sudo dnf install git wget curl -y

# display render: x, compositor: picom
sudo dnf install @base-x picom -y

# terminal
sudo dnf install kitty -y

# text editor
sudo dnf copr enable varlad/helix
sudo dnf install helix -y

# file explorer
sudo dnf copr enable pennbauman/ports
sudo dnf install lf -y
sudo dnf install bat poppler-utils -y

# screenshot utility
sudo dnf install maim -y

# wallpaper application
sudo dnf copr enable linuxredneck/xwallpaper
sudo dnf install xwallpaper -y

# sound drivers, sound emulator
sudo dnf install pavucontrol -y
# for bluetooth : install pulseaudio-bluetooth

# shell
sudo dnf install zsh -y
chsh -s /usr/bin/zsh

# sxiv - image viewer
# mpv - video player
# mpd - music player
sudo dnf install sxiv mpv fontawesome-fonts -y

# compilers
sudo dnf install gcc g++ python3 python3-pip make cmake -y
pip install openai

mkdir -p .local/src/
cd .local/src/

# window manager
git clone https://github.com/sumit-modak/dwm

# suckless software dependencies
sudo dnf install libX11-devel libXft-devel libXinerama-devel libXrandr-devel -y

cd ~/.local/src/dwm && sudo make clean install 
cd ~/.local/src/dmenu && sudo make clean install
cd ~/.local/src/slock && sudo make clean install
cd ~/.local/src/slstatus && sudo make clean install

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
