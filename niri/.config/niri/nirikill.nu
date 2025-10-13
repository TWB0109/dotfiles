#!/usr/bin/nu

let picked = (niri msg -j pick-window | from json)

if $picked.pid != null {
	print $"Killing ($picked.app_id) with PID: ($picked.pid)."
	notify-send "Nirikill" $"Killing ($picked.app_id) with PID: ($picked.pid)."
	kill $picked.pid
} else {
	print "No window selected or invalid JSON output."
	notify-send "Nirikill" "No window selected or invalid JSON output."
}
