#!/bin/bash

# Get the default source (microphone)
default_source=$(pactl get-default-source)

# Handle click events
case "$BLOCK_BUTTON" in
    1) pactl set-source-mute "$default_source" toggle ;;  # Left click to toggle mute
    4) pactl set-source-volume "$default_source" +5% ;;   # Scroll up: volume up
    5) pactl set-source-volume "$default_source" -5% ;;   # Scroll down: volume down
esac

# Get mute status
ismuted=$(pactl get-source-mute "$default_source" | cut -d' ' -f2)

if [ "$ismuted" = "yes" ]; then
    echo " "
else
    vol=$(pactl get-source-volume "$default_source" | grep -o '[0-9]\+%' | head -n 1)
    echo " $vol"
fi
