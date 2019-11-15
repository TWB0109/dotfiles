#!/bin/bash

# Install bashrc
cd "$(dirname "$0")"
cp bashrc $HOME
cd $HOME
mv bashrc .bashrc

# Install 20-intel.conf for tearing issue
cd "$(dirname "$0")"
sudo cp 20-intel.conf /etc/X11/xorg.conf.d/

# Install mpd folder
cd "$(dirname "$0")"
cp mpd $HOME
cd $HOME
mv mpd .mpd

# Install i3 folder
cd "$(dirname "$0")"
cp i3 $HOME/.config/

# Install polybar folder
cd "$(dirname "$0")"
cp polybar $HOME/.config/

# Install ncmpcpp folder
cd "$(dirname "$0")"
cp ncmpcpp $HOME
cd $HOME
mv ncmpcpp .ncmpcpp

# Install vimrc 
cd "$(dirname "$0")"
cp vimrc $HOME
cd $HOME 
mv vimrc .vimrc

# Install xinitrc
cd "$(dirname "$0")" 
cp xinitrc $HOME
cd $HOME
mv xinitrc .xinitrc

exit
