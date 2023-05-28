#!/usr/bin/sh

~/.local/bin/setbg &
picom --config ~/.config/picom/picom.conf -b &
while true; do
    # Log stderror to a file 
    dwm 2> ~/.cache/.dwm.log
    # No error logging
    # dwm >/dev/null 2>&1
done &
slstatus
