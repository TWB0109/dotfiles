#!/usr/bin/bash

[[ $(makoctl mode) == "default" ]] && makoctl mode -s do-not-disturb || makoctl mode -s default
pkill -RTMIN+1 waybar
