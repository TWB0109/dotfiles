#!/bin/bash
varName=$(echo "DDLC
OffTheBalls
Enter the Gungeon
Party Hard
SteamWorld Dig
Undertale" | rofi -dmenu -p "Games")

if [ "$varName" == "DDLC" ];
then
  cd ~/Games/DDLC-1.1.1-pc/ && ./DDLC.sh &
fi

if [ "$varName" == "OffTheBalls" ];
then
  cd ~/Games/OffTheBalls/ && ./OffTheBalls.x86_64 &
fi

if [ "$varName" == "Enter the Gungeon" ];
then
  cd ~/Games/Enter\ The\ Gungeon/ && ./EtG.x86_64 &
fi

if [ "$varName" == "Party Hard" ];
then
  cd ~/Games/Party\ Hard/ && ./PartyHardGame.x86_64 &
fi

if [ "$varName" == "SteamWorld Dig" ];
then
  cd ~/Games/SteamWorld\ Dig/ && cd game && ./SteamWorldDig &
fi

if [ "$varName" == "Undertale" ];
then
  cd ~/Games/Undertale/ && cd game && ./UNDERTALE &
fi
