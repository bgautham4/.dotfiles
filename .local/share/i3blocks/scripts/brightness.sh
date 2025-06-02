#!/bin/bash

# CONFIGURABLE
INCREMENT=10             # % increase/decrease
DDC_VCP_CODE=10          # VCP code for brightness
EXTERNAL_NAME="HDMI1"   # Update based on `xrandr`
INTERNAL_NAME="eDP1"    # Update based on `xrandr`

# Detect active primary display
ACTIVE_DISPLAY=$(xrandr --current | awk '/ connected primary/ {print $1}') || exit 1

# Function to get brightness
get_internal_brightness() {
    printf "%.0f%%" "$(xbacklight -get)"
}

set_internal_brightness() {
    xbacklight -inc "$1"
}

get_external_brightness() {
    printf "%d%%" "$(ddcutil getvcp "$DDC_VCP_CODE" 2>/dev/null | grep -oP 'current value\s*=\s*\K\d+')"
}

set_external_brightness() {
    ddcutil setvcp "$DDC_VCP_CODE" "$1" "$2" > /dev/null
}

# Main logic
case "$BLOCK_BUTTON" in
    3|4)  # Scroll up or Right click
        inc_or_dec='+'
        ;;
    1|5)  # Scroll down or left click
        inc_or_dec='-'
        ;;
esac

if [ "$ACTIVE_DISPLAY" = "$EXTERNAL_NAME" ]; then
    [ -n "$BLOCK_BUTTON" ] && set_external_brightness "$inc_or_dec" "$INCREMENT" 
    echo " $(get_external_brightness)"
else
    [ -n "$BLOCK_BUTTON" ] && set_internal_brightness "${inc_or_dec}${INCREMENT}" 
    echo " $(get_internal_brightness)"
fi

