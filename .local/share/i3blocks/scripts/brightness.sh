#!/bin/bash

# usage brightness.sh

#i3blocks will supply the BLOCK_BUTTON variable on click/scroll

# CONFIGURABLE
INCREMENT=10             # % increase/decrease
DDC_VCP_CODE=10          # VCP code for brightness
EXTERNAL_NAME="HDMI1"   # Update based on `xrandr`
INTERNAL_NAME="eDP1"    # Update based on `xrandr`

# Detect active primary display
ACTIVE_DISPLAY=$(xrandr --current | awk '/ connected primary/ {print $1}') || exit 1

# Function to get brightness
get_internal_brightness() {
    printf "%.0f" "$(xbacklight -get)"
}

set_internal_brightness() {
    xbacklight -set "$1"
}

get_external_brightness() {
    printf "%d" "$(ddcutil getvcp "$DDC_VCP_CODE" 2>/dev/null | grep -oP 'current value\s*=\s*\K\d+')"
}

set_external_brightness() {
    ddcutil setvcp "$DDC_VCP_CODE" "$1" 
}

BR=0
if [ "$ACTIVE_DISPLAY" = "$EXTERNAL_NAME" ]; then 
    BR=$(get_external_brightness)
else
    BR=$(get_internal_brightness)
fi

if [ -n "$BLOCK_BUTTON" ]; then
    case "$BLOCK_BUTTON" in
        3|4)  # Scroll up or Right click
            ((BR += INCREMENT))
            [ "$BR" -gt 100 ] && BR=100
            ;;
        1|5)  # Scroll down or left click
            ((BR -= INCREMENT))
            [ "$BR" -lt 0 ] && BR=0
            ;;
    esac

    if [ "$ACTIVE_DISPLAY" = "$EXTERNAL_NAME" ]; then
        set_external_brightness "$BR"
    else
        set_internal_brightness "$BR"
    fi
fi

full_text="󰃟 ${BR}%"

printf '{"full_text": "%s", "short_text": "%s", "color": "%s"}\n' "$full_text" "$full_text" "$(xrdb -get i3blocks.foreground)"
