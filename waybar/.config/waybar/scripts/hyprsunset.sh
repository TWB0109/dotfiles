#!/usr/bin/bash

# Initialize the state variable
STATE_FILE="/tmp/hyprsunset_state"

if [ -f "$STATE_FILE" ]; then
	CURRENT_STATE=$(cat "$STATE_FILE")
else
	CURRENT_STATE=6000
	echo "$CURRENT_STATE" >"$STATE_FILE"
fi

if [ "$CURRENT_STATE" -eq 6000 ]; then
	hyprctl hyprsunset temperature 2500
	echo "2500" >"$STATE_FILE"
else
	hyprctl hyprsunset temperature 6000
	echo "6000" >"$STATE_FILE"
fi

pkill -SIGRTMIN+4 waybar
