
# Linux X-Server Setup, Config & Scripts

These repository contains scripts and configuration files of those applications which I used to rice linux:

| Applications            | Packages                |
| :---------------------- | :---------------------- |
| shell                   | zsh                     |
| display_server		      | x                       |
| compositor			        | picom                   |
| window_manager          | dwm                     |
| statusbar               | slstatus                |
| application_launcher    | dmenu                   |
| display manager         | slock                   |
| background              | xwallpaper              |
| screenshot_tool		      | maim                    |
| terminal                | kitty                   |
| text_editor			        | helix + neovim          |
| file_explorer           | lf                      |
| cli_image_preview       | kitty-kitten-icat       |
| fonts                   | hack-nerd-fonts         |
| image_viewer			      | sxiv                    |
| video_player			      | mpv 			              |
| audio_player			      | mpd                     |

# Installation

Install latest release of debian and run
```
rm -rf .bash* .profile .sudo* .local/ &&
sudo apt install git &&
git clone --depth=1 https://github.com/sumit-modak/xconfig ~ &&
~/.local/bin/install.sh
```

## Screenshots
![image](multimedia/rice-ss/Screenshot_2023-05-21_14:55:42.png)
![image](multimedia/rice-ss/Screenshot_2023-06-02_18:07:42.png)

## Debian 12 minimal & expert installation guide
https://www.youtube.com/watch?v=MoWApyUb5w8

## Searching for alternative package names
https://github.com/sumit-modak/xconfig/tree/master/.config/packages 
