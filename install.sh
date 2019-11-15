#!/bin/bash

# Define Variables
dir=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)

# Install bashrc
cd $dir
cp bashrc $HOME
cd $HOME
mv bashrc .bashrc

# Install 20-intel.conf for tearing issue
cd $dir
sudo cp 20-intel.conf /etc/X11/xorg.conf.d/

# Install mpd folder
cd $dir
cp mpd $HOME
cd $HOME
mv mpd .mpd

# Install i3 folder
cd $dir
cp i3 $HOME/.config/

# Install polybar folder
cd $dir
cp polybar $HOME/.config/

# Install ncmpcpp folder
cd $dir
cp ncmpcpp $HOME
cd $HOME
mv ncmpcpp .ncmpcpp

# Install vimrc 
cd $dir
cp vimrc $HOME
cd $HOME 
mv vimrc .vimrc

# Install xinitrc
cd $dir
cp xinitrc $HOME
cd $HOME
mv xinitrc .xinitrc
cd $dir

exit
