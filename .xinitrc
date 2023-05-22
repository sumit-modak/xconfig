#!/usr/bin/sh

picom --config ~/.config/picom/picom.conf -b &
~/.local/bin/setbg &
~/.local/bin/setstatus &
exec dwm
