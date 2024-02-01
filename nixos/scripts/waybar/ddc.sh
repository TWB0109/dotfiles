#!/usr/bin/env nix-shell
#! nix-shell -i bash -p bash mako

state=$(ddcutil --noverify --sleep-multiplier .1 getvcp 10 | grep -o -P '\d*,' | grep -Eo '[0-9]' | tr -d '\n')
echo $state
