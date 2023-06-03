#!/usr/bin/sh

# /usr/bin/pipewire &
# /usr/bin/pipewire-pulse &
# /usr/bin/pipewire-media-session &
~/.local/bin/setbg &
picom --config ~/.config/picom/picom.conf -b &
slstatus &
while true; do
    # Log stderror to a file 
    dwm 2> ~/.cache/.dwm.log
    # No error logging
    # dwm >/dev/null 2>&1
done