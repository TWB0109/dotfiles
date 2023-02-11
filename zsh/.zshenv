export ZDOTDIR=~/.config/zsh
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
. "$HOME/.cargo/env"
