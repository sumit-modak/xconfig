#!/usr/bin/bash

sudo apt update && sudo apt upgrade -yy

sudo apt install -yy git wget curl zsh \
xorg xserver-xorg picom xwallpaper maim \
libxft-dev libx11-dev libxinerama libxcb1-dev libxrandr-dev \
kitty helix lf bat poppler-utils sxiv mpv mpd \
gcc g++ python3 python3-pip make cmake

pip install openai

chsh -s /usr/bin/zsh

mkdir -p .local/src/
cd .local/src/

# window manager
git clone https://github.com/sumit-modak/dwm

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
