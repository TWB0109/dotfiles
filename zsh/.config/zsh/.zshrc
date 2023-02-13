# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
bindkey -v
bindkey -M viins 'ii' vi-cmd-mode
# End of lines configured by zsh-newuser-install

# Enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Import colorscheme from wal asynchronously
# (cat ~/.cache/wal/sequences &)

# Alternative (blocks for terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added
# source ~/.cache/wal/colors-tty.sh

# ENV VARIABLES
export XDG_CONFIG_HOME=$HOME/.config
export LUA_PATH='/home/leafo/.luarocks/share/lua/5.1/?.lua;/home/leafo/.luarocks/share/lua/5.1/?/init.lua;/usr/share/lua/5.1/?.lua;/usr/share/lua/5.1/?/init.lua;;./?.lua;/usr/lib/lua/5.1/?.lua;/usr/lib/lua/5.1/?/init.lua'
export LUA_CPATH='/home/leafo/.luarocks/lib/lua/5.1/?.so;/usr/lib/lua/5.1/?.so;;./?.so;/usr/lib/lua/5.1/loadall.so'
export PATH=/home/brandon/.local/bin:/home/brandon/.scripts:~/.config/nvm/versions/node/*/lib/node_modules:~/.emacs.d/bin:~/.local/lib/python3.*/site-packages:~/.cargo/bin:~/.ghcup/bin:~/.cabal/bin:/var/lib/snapd/snap/bin:~/Applications:~/.local/share/flatpak/exports/bin:~/.nimble/bin:~/.local/share/neovim/bin:~/.luarocks/bin/:$PATH

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR=vim
else
    export EDITOR=nvim 
fi

#export TERMINAL=st
#export NPM_CONFIG_PREFIX=~/.npm-global
export TERMINAL=kitty
export TERM=xterm-256color
export PAGER=less

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


# Aliases
alias vim="nvim"
alias c="clear"
alias :q="exit"
alias Syu="sudo pacman -Syu"
alias ls="exa --color=always --group-directories-first --icons"
alias chall="chmod +x *"
alias grep="grep --colour=auto"
alias egrep="egrep --colour=auto"
alias fgrep="fgrep --colour=auto"
alias sxiv="sxiv -a"

# xbps related alias
#alias xi="sudo xbps-install -S"
#alias xq="xbps-query -Rs"
#alias xs="sudo xbps-install -Su"
#alias xr="sudo xbps-remove -R"
#alias xrr="sudo xbps-remove"

# Functions
function pget () {
    session=$(bw unlock | tail -n 1 | sed 's/$//g' | awk '{print $6}')
    bw get password $1 --session $session | xclip -selection c 
    echo -e "\e[30;1;41mThe password was copied to your clipboard.\e[0m\n\e[30;1;43mThe clipboard will be cleared in 10 seconds\e[0m"
    sleep 10s
    xclip -i -selection c < /dev/null
    bw lock --quiet
    echo -e "\e[30;1;42mYour clipboard has been cleared and your vault locked\e[0m"
}

function eget() {
    session=$(bw unlock | tail -n 1 | sed 's/$//g' | awk '{print $6}')
    bw get username $1 --session $session | xclip -selection c
    echo -e "\e[30;1;41mThe username was copied to your clipboard.\e[0m\n\e[30;1;43mThe clipboard will be cleared in 10 seconds\e[0m"
    sleep 10s
    xclip -i -selection c < /dev/null
    bw lock --quiet
    echo -e "\e[30;1;42mYour clipboard has been cleared and your vault locked\e[0m"
}

function sxw() {
    wallpaper=$(nsxiv -o ~/.local/share/backgrounds/)
    nitrogen --set-scaled $wallpaper

    touch ~/.sxw && chmod +x ~/.sxw && echo "nitrogen --set-scaled $wallpaper" > ~/.sxw
}

function giftowebm () {
    ffmpeg -i "${1}.gif" -c vp9 -b:v 0 -crf 40 "${1}.webm"
}

function mp4towebm () {
    ffmpeg  -i "${1}.mp4"  -lossless 1  "${1}.webm"
}

# Laziness
alias vw="vim +:VimwikiIndex"
alias zrc="vim ~/.config/zsh/.zshrc"
alias vrc="vim ~/.config/nvim/init.vim"
alias py="python"
alias lsblk="lsblk -e7"
alias open="xdg-open"

# Plugins
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# ^ disabled for me, too resource heavy

# Enable the starship prompt
eval $(starship init zsh)
