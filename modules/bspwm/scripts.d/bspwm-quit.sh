#!/usr/bin/env bash

logout() {
	pids=$(bspc query --nodes | while read -r winid; do
		xdotool getwindowpid "$winid" 2>/dev/null
	done | sort -u)

	bspc query --nodes | while read -r winid; do
		xdotool windowkill "$winid"
	done

	sleep 2

	for pid in $pids; do
		if kill -0 "$pid" 2>/dev/null; then
			kill -9 "$pid"
		fi
	done

	bspc quit 1
}

logout
