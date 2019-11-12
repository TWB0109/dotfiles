#!/bin/bash
varName=$(echo "DDLC
OffTheBalls" | rofi -dmenu -p "Games")

if [ "$varName" == "DDLC" ];
then
  cd ~/Games/DDLC-1.1.1-pc/ && ./DDLC.sh &
fi

if [ "$varName" == "OffTheBalls" ];
then
  cd ~/Games/OffTheBalls/ && ./OffTheBalls.x86_64 &
fi
