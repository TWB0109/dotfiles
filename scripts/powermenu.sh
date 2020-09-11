#!/bin/bash

selected=$(echo "Shutdown
Reboot
Lock
Suspend
Logout" | rofi -dmenu -yoffset 118 -xoffset 1195 -p "Powermenu ")
if [ "$selected" == "Lock" ];
then
  betterlockscreen -l dimblur
fi

if [ "$selected" == "Shutdown" ];
then
  shutdown now
fi

if [ "$selected" == "Reboot" ];
then
  reboot
fi

if [ "$selected" == "Suspend" ];
then
  systemctl suspend
fi

if [ "$selected" == "Logout" ];
then
  i3exit logout
fi
