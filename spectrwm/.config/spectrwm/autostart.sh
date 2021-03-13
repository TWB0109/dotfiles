#!/bin/bash

setxkbmap -option caps:swapescape
nitrogen --restore
xrdb ~/.Xresources
$HOME/.scripts/natscroll
xss-lock --transfer-sleep-lock -- "betterlockscreen -l dimblur" --nofork &
mpd &
