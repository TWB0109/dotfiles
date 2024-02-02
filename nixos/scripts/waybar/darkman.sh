#!/usr/bin/env -S nix shell nixpkgs#bash nixpkgs#darkman --command bash

state=$(darkman get)

if [[ $state == "light" ]];
then
    echo ""
else
    echo ""
fi
