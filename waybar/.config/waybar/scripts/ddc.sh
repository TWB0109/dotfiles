#!/usr/bin/bash

state=$(ddcutil --noverify --less-sleep getvcp 10 | grep -o -P '\d*,' | grep -Eo '[0-9]' | tr -d '\n')
echo

echo $state
