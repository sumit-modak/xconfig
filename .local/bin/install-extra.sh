#!/usr/bin/bash

# Brave Browser
 # flatpak install flathub com.brave.Browser && flatpak run com.brave.Browser
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm.release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

# Discord
# Spotify
# OBS-Studio
# GIMP
# Minecraft

# ncmpcpp - music visualizer
# neofetch - system comfiguration
# cmatrix - flying text animation
# figlet - ascii to ascii art
sudo dnf install neofetch htop cmatrix figlet
