export ZDOTDIR=~/.config/zsh
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export XDG_CACHE_HOME=~/.cache/
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
. "$HOME/.cargo/env"
