#!/usr/bin/env -S nix shell nixpkgs#bash nixpkgs#mako --command bash

state=$(makoctl mode)

[[ $state == "default" ]] && echo "" || echo ""
