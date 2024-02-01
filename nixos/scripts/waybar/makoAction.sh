#!/usr/bin/env nix-shell
#! nix-shell -i bash -p bash mako

[[ $(makoctl mode) == "default" ]] && makoctl mode -s do-not-disturb || makoctl mode -s default
pkill -RTMIN+1 waybar
