# The following lines were added by compinstall
zstyle :compinstall filename '/home/brandon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# Export the PATH variable
export PATH=/home/brandon/.local/bin:/home/brandon/.scripts:~/.npm-global/bin:$PATH

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

# Environment Variables
export XDG_MUSIC_DIR=~/music/
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR=nvim
else
    export EDITOR=nvim
fi
export TERMINAL=alacritty
export PAGER=less
export NPM_CONFIG_PREFIX=~/.npm-global

# Aliases
alias vim="$EDITOR"
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
alias zrc="vim ~/.zshrc"
alias vrc="vim ~/.config/nvim/init.vim"

# Enable the starship prompt
eval $(starship init zsh)

# Enable syntax highlighting
source /home/brandon/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
