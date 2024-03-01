#!/usr/bin/bash

stty -ixon # Disable Ctrl-s and Ctrl-q
HISTFILE=$XDG_CONFIG_HOME/zsh/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '.zshrc'

# beeping is annoying
unsetopt BEEP

autoload -Uz compinit
compinit

# ============================= plugins ============================== #
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        # For plugins
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
# ============================= ////// ============================== #


# ============================= prompt ============================== #
autoload -U colors && colors
PROMPT="[%{$fg[cyan]%}%~%{$reset_color%}]%(?:%{$fg_bold[green]%} $:%{$fg_bold[red]%} $) "
# ============================= ////// ============================== #


# ============================= aliases ============================== #
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
# alias l="ls -lAGhv --color --group-directories-first"
alias ls="eza -aFl --group-directories-first --icons"
alias lsa="eza -aF --group-directories-first --icons"
alias lst="eza -aFT --group-directories-first --icons"
alias tmux="zellij"
alias ascii="bat ~/.local/share/ascii"
alias imgcat="kitty +kitten icat"
alias c="clear"

alias tell="espeak-ng"
# alias gpt="cd ~/.local/bin/ && python3 ~/.local/bin/chat-gpt.py && cd -"
# alias kbdmap="setxkbmap us; xmodmap $HOME/.config/xmodmap/xmodmap && xset r 66"
# alias kbdreset="setxkbmap us; xset -r 66"

sed "s/\s*#.*$//g; /^$/d" $HOME/priv/incidents/quotes | shuf -n 1 2> /dev/null | lolcat
