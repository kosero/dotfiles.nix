#!/usr/bin/env bash

BG="#2B3339"
FG="#D3C6AA"
ACCENT="#A7C080"
DIM="#475258"
YELLOW="#DBBC7F"
BLUE="#7FBBB3"
MAGENTA="#D699B6"
CYAN="#83C092"
RED="#E67E80"

FONT="Iosevka:size=10"

pkill -x lemonbar
pkill -f "bspc subscribe"

PANEL_FIFO="/tmp/lemonbar_fifo"
[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"

bspc subscribe report > "$PANEL_FIFO" &
BSPC_PID=$!

(
    while true; do
        DATETIME=$(date "+%H:%M %a %b %Y")
        
        CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%d%%", usage}')
        MEM=$(free -m | awk '/Mem:/ { printf("%dMB", $3) }')
        
        VOL_INFO=""
        if command -v amixer >/dev/null 2>&1; then
            AMIXER_OUT=$(amixer sget Master 2>/dev/null)
            if echo "$AMIXER_OUT" | grep -q '\[off\]'; then
                VOL_INFO=" %{F${RED}}Muted%{F-} |"
            else
                VOL=$(echo "$AMIXER_OUT" | awk -F"[][]" '/Left:/ { print $2 }' | head -n1)
                [ -n "$VOL" ] && VOL_INFO=" %{F${MAGENTA}}VOL: ${VOL}%{F-} |"
            fi
        fi
        
        BATTERY_INFO=""
        if [ -d /sys/class/power_supply/BAT1 ]; then
            CAP=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null)
            STAT=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null)
            if [ "$STAT" = "Charging" ]; then
                BATTERY_INFO=" %{F${YELLOW}}BAT: ${CAP}% (⚡)%{F-}"
            else
                BATTERY_INFO=" BAT: ${CAP}%"
            fi
        fi

        echo "S ${VOL_INFO} CPU: ${CPU} | RAM: ${MEM} |${BATTERY_INFO}%{c}${DATETIME}"
        sleep 2
    done
) > "$PANEL_FIFO" &
STATUS_PID=$!

trap 'kill $BSPC_PID $STATUS_PID 2>/dev/null; rm -f "$PANEL_FIFO"' EXIT

CURRENT_WS=""
CURRENT_STATUS=""

cat "$PANEL_FIFO" | while read -r line; do
    case $line in
        W*)
            IFS=':' read -ra ADDR <<< "$line"
            WS=""
            for i in "${ADDR[@]}"; do
                STATE=${i:0:1}
                NAME=${i:1}

                case $STATE in
                    O|F|U)
                        WS="${WS}%{B${ACCENT}}%{F${BG}}  ${NAME}  %{B-}%{F-}"
                        ;;
                    o)
                        WS="${WS}%{F${FG}}  ${NAME}  %{F-}"
                        ;;
                    f)
                        WS="${WS}%{F${DIM}}  ${NAME}  %{F-}"
                        ;;
                esac
            done
            CURRENT_WS="$WS"
            ;;
        S\ *)
            CURRENT_STATUS="${line:2}"
            ;;
    esac

    echo "%{l} ${CURRENT_WS} %{r}${CURRENT_STATUS}  "
done | lemonbar -p -g x32 -B "$BG" -F "$FG" -f "$FONT"
