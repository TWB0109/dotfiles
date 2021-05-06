# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
bindkey -M viins 'ii' vi-cmd-mode
# End of lines configured by zsh-newuser-install

# Enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Import colorscheme from wal asynchronously
(cat ~/.cache/wal/sequences &)

# Alternative (blocks for terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added
source ~/.cache/wal/colors-tty.sh

# BLING
neofetch

# ENV VARIABLES
export XDG_CONFIG_HOME=$HOME/.config

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR=nvim
else
    export EDITOR=nvim 
fi
#export TERMINAL=alacritty
export TERMINAL=st
export PAGER=less
export NPM_CONFIG_PREFIX=~/.npm-global

# Aliases
alias vim="nvim"
alias c="clear"
alias :q="exit"
alias Syu="sudo pacman -Syu"
alias ls="exa --color=always --group-directories-first"
alias chall="chmod +x *"
alias grep="grep --colour=auto"
alias egrep="egrep --colour=auto"
alias fgrep="fgrep --colour=auto"
alias sxiv="sxiv -a"

# Functions
function password () {
    session=$(bw unlock | tail -n 1 | sed 's/$//g' | awk '{print $6}')
    bw get password $1 --session $session | xclip -selection c 
}

# Laziness
alias vw="vim +:VimwikiIndex"
alias zrc="vim ~/.config/zsh/.zshrc"
alias vrc="vim ~/.config/nvim/init.vim"

# Plugins
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# ^ disabled for me, too resource heavy

# Enable the starship prompt
eval $(starship init zsh)
