#!/bin/sh

run() {
	bin="$1"
	shift
	pgrep -x "$bin" > /dev/null && pkill -x "$bin"
	"$bin" "$@" &
}

run sxhkd -c "$HOME/.config/bspwm/sxhkdrc"
run bspwmbar
# run picom -b
run feh --bg-fill "$HOME/.config/bspwm/wallpapers/sunako_everforest.png"

# xset -dpms
# xset s 10800 10800
# xss-lock -- systemctl poweroff &

run $HOME/.config/bspwm/scripts.d/low_bat_notifier.sh &
run $HOME/.config/bspwm/scripts.d/idle-poweroff.sh &
