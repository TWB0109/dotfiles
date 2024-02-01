#!/usr/bin/env nix-shell
#! nix-shell -i bash -p bash mako

state=$(makoctl mode)

[[ $state == "default" ]] && echo "" || echo ""
