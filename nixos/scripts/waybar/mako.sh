#!/bin/sh 

state=$(makoctl mode)

[[ $state == "default" ]] && echo "" || echo ""
