# export XDG_CONFIG_HOME=$HOME/.config/
# export XDG_CACHE_HOME=$HOME/.cache/
# export XDG_SOURCE_HOME=$HOME/.local/src
# export XDG_DATA_HOME=$HOME/.local/share
# export XDG_STATE_HOME=$HOME/.local/state

if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep -x dwm || exec startx &&
fi

rm /home/sumit/.serverauth.* 2> /dev/null
