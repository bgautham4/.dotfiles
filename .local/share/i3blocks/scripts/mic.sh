#!/bin/bash

# Get the default source (microphone)
default_source=$(pactl get-default-source)

# Handle click events
case "$BLOCK_BUTTON" in
    1) pactl set-source-mute "$default_source" toggle ;;  # Left click to toggle mute
    3) pavucontrol -t 4 ;; #GUI based edit
    4) pactl set-source-volume "$default_source" +5% ;;   # Scroll up: volume up
    5) pactl set-source-volume "$default_source" -5% ;;   # Scroll down: volume down
esac

# Get mute status
ismuted=$(pactl get-source-mute "$default_source" | cut -d' ' -f2)
full_text=""
if [ "$ismuted" = "yes" ]; then
    full_text=" "
else
    vol=$(pactl get-source-volume "$default_source" | grep -o '[0-9]\+%' | head -n 1)
    full_text=" $vol"
fi
printf '{"full_text": "%s", "short_text": "%s", "color": "%s"}\n' "$full_text" "$full_text" "$(xrdb -get i3blocks.foreground)"
