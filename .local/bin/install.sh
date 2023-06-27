#!/usr/bin/bash

sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update && sudo apt upgrade -yy

sudo apt install -yy git wget curl zip unzip zsh \
xorg xserver-xorg picom xwallpaper maim \
libxft-dev libx11-dev libxinerama-dev libxcb1-dev libxrandr-dev \
kitty helix lf bat poppler-utils sxiv mpv mpd \
gcc g++ python3 python3-pip make cmake

pip install openai

chsh -s /usr/bin/zsh

cd .local/src/
git clone https://github.com/sumit-modak/dwm

cd ~/.local/src/dwm && sudo make clean install 
cd ~/.local/src/dmenu && sudo make clean install
cd ~/.local/src/slock && sudo make clean install
cd ~/.local/src/slstatus && sudo make clean install

cd 