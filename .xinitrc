#!/usr/bin/sh

# Setting custom colemak layout
# setxkbmap us; xmodmap xmodmap/xmodmap.colemak && xset r 66 &

# Switching back to qwerty
# setxkbmap us; xset -r 66

xrandr --output Virtual-1 --mode 1920x1080 --rate 59.96 &
~/.local/bin/setbg &
picom --config ~/.config/picom/picom.conf -b &
slstatus &
while true; do
    dwm 2> ~/.cache/.dwm.log
    # dwm >/dev/null 2>&1
done
