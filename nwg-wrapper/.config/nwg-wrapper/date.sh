#!/usr/bin/bash

time=$(LC_ALL=C TZ='America/Costa_Rica' date +' %a, %b %d, %Y | %H:%M')
echo '<span size="20000" foreground="#b8bb26" background="#282828">'$time'</span>'
