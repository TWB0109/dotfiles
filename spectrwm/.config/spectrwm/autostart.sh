#!/bin/bash

setxkbmap -option caps:swapescape\
          -option compose:lctrl-altgr
nitrogen --restore
xrdb ~/.Xresources
$HOME/.scripts/natscroll
mpd &
