#!/usr/bin/env -S nix shell nixpkgs#bash nixpkgs#mako --command bash

[[ $(makoctl mode) == "default" ]] && makoctl mode -s do-not-disturb || makoctl mode -s default
pkill -RTMIN+1 waybar
