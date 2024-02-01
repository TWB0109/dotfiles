#!/usr/bin/env nix-shell
#! nix-shell -i bash -p bash mako

state=$(darkman get)

if [[ $state == "light" ]];
then
    echo ""
else
    echo ""
fi
