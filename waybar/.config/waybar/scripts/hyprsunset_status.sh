#!/usr/bin/bash

state=$(cat /tmp/hyprsunset_state)

if [[ $state == "2500" ]]; then
	echo "󱩌"
else
	echo "󰌵"
fi
