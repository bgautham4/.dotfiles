#!/bin/bash

# Get the default sink
default_sink=$(pactl get-default-sink)

# Handle mouse clicks
case "$BLOCK_BUTTON" in
    1) pactl set-sink-mute "$default_sink" toggle ;;  # Left click: mute/unmute
    3) pavucontrol -t 3 ;; #For GUI based edit
    4) pactl set-sink-volume "$default_sink" +5% ;;   # Scroll up: volume up
    5) pactl set-sink-volume "$default_sink" -5% ;;   # Scroll down: volume down
esac

# Refresh info after click
ismuted=$(pactl get-sink-mute "$default_sink" | cut -d' ' -f2)

full_text=""
if [ "$ismuted" = "yes" ]; then
    full_text=" "
else
    vol=$(pactl get-sink-volume "$default_sink" | grep -o '[0-9]\+%' | head -n 1)
    vol_number=${vol%\%}

    if [ "$vol_number" -lt 30 ]; then
        symbol=""
    elif [ "$vol_number" -lt 70 ]; then
        symbol=" "
    else
        symbol="  "
    fi

    full_text="$symbol $vol"
fi

printf '{"full_text": "%s", "short_text": "%s", "color": "%s"}\n' "$full_text" "$full_text" "$(xrdb -get i3blocks.foreground)"
