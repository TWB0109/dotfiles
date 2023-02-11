# Dotfiles
All my needed dotfiles for a future OS hop

# Notes
* For zsh and sway (which includes rofi, kitty, darkman, waybar, sway and darkman configs) to work correctly you need to issue:
  * ```bash
      git submodule init
      git submodule update
      ```
# Usage
```bash
git clone https://github.com/TWB0109/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow x # X meaning any folder in the repo that you'd like to install as your config, please back up your configs first.
```
