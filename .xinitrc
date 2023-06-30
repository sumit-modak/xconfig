#!/usr/bin/sh

# /usr/bin/pipewire &
# /usr/bin/pipewire-pulse &
# /usr/bin/pipewire-media-session &
xrandr --output Virtual-1 --mode 1920x1080 --rate 59.96 &
~/.local/bin/setbg &
picom --config ~/.config/picom/picom.conf -b &
slstatus &
while true; do
    dwm 2> ~/.cache/.dwm.log
    # dwm >/dev/null 2>&1
done