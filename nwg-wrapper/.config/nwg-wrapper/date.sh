#!/usr/bin/bash

time=$(LC_ALL=C TZ='America/Costa_Rica' date +' %a, %b %d, %Y | %H:%M')
echo '<span size="20000" foreground="#79740e" background="#f2e5bc">'$time'</span>'
