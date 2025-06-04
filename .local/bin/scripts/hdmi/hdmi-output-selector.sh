#!/bin/bash

#Usage hdmi-output-selector.sh

#A dmenu based output config picker using autorandr(1)

CON=$(</sys/class/drm/card1-HDMI-A-1/status) || exit 1
[ "$CON" = 'disconnected' ] && notify-send --urgency=low -t 5000 "Error" "No HDMI devices" && exit 0

type=$(autorandr --list | dmenu -p "Select display config:")
[ -n "$type" ] && autorandr -l "$type" && notify-send --urgency=low -t 5000 "Display config" "$type" || exit 0

#Send signal to update brightness value
pkill -SIGRTMIN+9 i3blocks 2> /dev/null
