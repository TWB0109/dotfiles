##############################            
#            _               #
#    _______| |__  _ __ ___  #
#   |_  / __| '_ \| '__/ __| #
#  _ / /\__ \ | | | | | (__  #
# (_)___|___/_| |_|_|  \___| #
#                            #
#            TWB0109         #
##############################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:/usr/local/bin:$HOME/.scripts:$HOME/.gem/ruby/2.7.0/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/brandon/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true 
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
         git
         vi-mode
         emoji 
         themes
         zsh-interactive-cd
         zsh-autosuggestions
         zsh-syntax-highlighting
         bgnotify
         colored-man-pages
)

# Startup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh
# Import colorscheme from wal asynchronously
(cat ~/.cache/wal/sequences &)
# Alternative (blocks for terminal for 0-3ms)
cat ~/.cache/wal/sequences
# To add support for TTYs this line can be optionally added
source ~/.cache/wal/colors-tty.sh
# neofetch
# Better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;3"

session=$(tmux has-session -t main 2>/dev/null)

[[ "$session" -eq 0 && "$TERM" = "alacritty" ]] && tmux new -s main 2>/dev/null
[[ -z "$session" && "$TERM" = "alacritty" ]] && tmux attach -t main

export XDG_MUSIC_DIR=~/music/
export TERMINAL=termite
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export XIM_PROGRAM=/usr/bin/ibus-daemon

# User configuration
 
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=es_CR.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Use less as a pager
export PAGER='less'

# Aliases
alias omz="cd ~/.oh-my-zsh"
alias -g sed="sed -i"
alias c="clear"
alias cz="clear && source ~/.zshrc"
alias ls="lsd --color=always --group-dirs"
alias chall="chmod +x *"
alias grep="grep --colour=auto"
alias egrep="egrep --colour=auto"
alias fgrep="fgrep --colour=auto"
alias date="LC_ALL=C date"

alias -g sw="i3-swallow"
alias -g pavol="pactl set-sink-volume @DEFAULT_SINK@"
alias sxiv="sxiv -a"
alias dvtm="dvtm -m ^f"
alias sptad="env LD_PRELOAD=/usr/lib/spotify-adblock.so spotify %U"
alias drivemount="rclone mount GDrive: ~/Drive --daemon"
alias driveumount="fusermount -u ~/Drive"
alias cdate='date "+%d-%m-%Y"'
alias tdate='date -d tomorrow "+%d-%m-%Y"'

alias zrc="vim ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*    \.){3}[0-9]*).*/\2/p'"
alias 256c="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash"
alias -g att="tmux attach -t"

# User variables
LATEXDIR='/home/brandon/Documentos/LaTeX/'
android='/run/user/1000/544ba225466efb1c/primary'

