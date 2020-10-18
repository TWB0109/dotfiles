#!/bin/bash

#####################################
#   ____                 _          #
#  / ___|  ___ _ __ ___ | |_ ___    #
#  \___ \ / __| '__/ _ \| __/ _ \   #
#   ___) | (__| | | (_) | || (_) |  #
#  |____/ \___|_|  \___/ \__\___/   #
#                                   #
#####################################

# An intuitive script to take screenshots with scrot (Copyright (C) 1999,2000 Tom Gilbert.)

# Define variables
delay=0
scrotType=""
delayConfirm=""
line="" #y/n
style="" #solid/dash
width="" #y/n
widthQuantity=1

# Print a welcome screen
echo "*******************************************************************************"
echo "*Welcome to scroto.sh, an interactive software to take screenshots with scrot.*"
echo "*******************************************************************************"
printf "%s\n\n" ""

# Ask for the user what kind of screenshot do they want to take.
echo "What kind of screenshot do you want to take? (normal/selected)"
read scrotType
printf "%s\n" ""

# Conditional structure
if [ "$scrotType" == "normal" ];
then
  echo "Would you like to have a delay? (y/n)"
  read delayConfirm
  printf "%s\n" ""
  if [ "$delayConfirm" == "y" ] || [ "$delayConfirm" == "s" ];
  then
    echo "How much delay do you want? (Seconds)"
    read delay
    printf "%s\n" ""
    echo "Taking screenshot in $delay seconds"; scrot -d $delay $HOME/scrot.png 
    printf "%s\n" ""
  else
    echo "Taking screenshot"; scrot -d 0 $HOME/scrot.png 
    printf "%s\n" ""
  fi
else [ "$scrotType" == "selected" ];
  echo "Do you want to have a delay? (y/n)"
  read delayConfirm 
  printf "%s\n" ""
  if [ "$delayConfirm" == "y" ] || [ "$delayConfirm" == "s" ];
  then
    echo "How much delay do you want? (Seconds)"
    read delay
    printf "%s\n" ""
    echo "Taking screenshot in $delay seconds"; scrot -d $delay --select $HOME/scrot.png 
  else
    echo "Taking Screenshot"; scrot -d 0 --select $HOME/scrot.png 
  fi
fi
