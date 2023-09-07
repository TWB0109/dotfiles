#!/usr/bin/bash

state=$(makoctl mode)

[[ $state == "default" ]] && echo "" || echo ""
