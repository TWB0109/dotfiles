#!/usr/bin/bash

shader=$(hyprshade current)

if [[ $shader == "blf" ]]; then
    echo "󱩌"
else
    echo "󰌵"
fi

pkill -RTMIN+3 waybar
