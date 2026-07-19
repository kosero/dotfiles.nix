#!/usr/bin/env bash

# Terminate already running bar instances
pkill -u $UID -x polybar || true

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar main -c "$HOME/.config/bspwm/polybar/config.ini" 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
