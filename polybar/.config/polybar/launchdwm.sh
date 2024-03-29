#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch example 

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m /usr/local/bin/polybar --reload example &
    done
else 
    /usr/local/bin/polybar --reload example &
fi

echo "Bars launched..."
