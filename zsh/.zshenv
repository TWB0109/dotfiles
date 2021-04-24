export PATH=/home/brandon/.local/bin:/home/brandon/.scripts:~/.npm-global/bin:$PATH
export ZDOTDIR=~/.config/zsh

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR=nvim
else
    export EDITOR=nvim
fi
export TERMINAL=alacritty
export PAGER=less
export NPM_CONFIG_PREFIX=~/.npm-global
