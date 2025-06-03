#!/bin/bash
#dmenu output config picker
CON=$(</sys/class/drm/card1-HDMI-A-1/status) || exit 1
[ "$CON" = 'disconnected' ] && notify-send --urgency=low -t 5000 "Error" "No HDMI devices" && exit 0

type=$(autorandr --list | dmenu -p "Select display config:")
autorandr -l "$type"
notify-send --urgency=low -t 5000 "Display config" "$type" 
