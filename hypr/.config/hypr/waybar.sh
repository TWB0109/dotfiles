#!/usr/bin/bash

if pgrep -x "waybar" > /dev/null
then
    killall -SIGUSR2 waybar
else
    killall waybar > /dev/null
    waybar -c ~/.config/waybar/hyprconfig -s ~/.config/waybar/hyprstyle.css
fi

