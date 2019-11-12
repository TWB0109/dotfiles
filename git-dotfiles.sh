#!/bin/bash

configFile=""
gitRepository="https://github.com/TWB0109/dotfiles.git"

echo "What config file do you want to push?"
read configFile

if [ "$configFile" == "i3" ];
then
  cd ~/.config/i3/
  git clone $gitRepository
  cp -a config  dotfiles/i3/
  cd dotfiles

  git add .
  git commit -m "Updated i3 config file"
  git push https://github.com/TWB0109/dotfiles.git master

  cd ..
  rm -rf dotfiles
  exit
fi

if [ "$configFile" == "polybar" ];
then
  cd ~/.config/polybar/
  git clone $gitRepository
  cp -a config dotfiles/polybar/
  cd dotfiles

  git add .
  git commit -m "Updated polybar config file"
  git push https://github.com/TWB0109/dotfiles.git master

  cd ..
  rm -rf dotfiles
  exit
fi


if [ "$configFile" == "bash" ];
then
  cd $HOME
  git clone $gitRepository
  cp -a .bashrc dotfiles/
  cd dotfiles
  mv .bashrc bashrc

  git add .
  git commit -m "Updated bash config file"
  git push https://github.com/TWB0109/dotfiles.git master

  cd ..
  rm -rf dotfiles
  exit
fi

if [ "$configFile" == "vim" ];
then
  cd $HOME
  git clone $gitRepository
  cp -a .vimrc dotfiles/
  cd dotfiles
  mv .vimrc vimrc

  git add .
  git commit -m "Updated vim config file"
  git push https://github.com/TWB0109/dotfiles.git master

  cd ..
  rm -rf dotfiles
  exit
fi
