#!/usr/bin/sh

xrandr --output Virtual-1 --mode 1920x1080 --rate 60 &
# xwallpaper --zoom $HOME/priv/into_a_champ.png &
~/.local/script/setbg &
picom --config ~/.config/picom/picom.conf -b &
slstatus &
while true; do
    dwm 2> ~/.cache/.dwm.log
    # dwm >/dev/null 2>&1
done
