#!/bin/bash

#Usage hdmi-output-selector.sh

#A dmenu based output config picker using autorandr(1)

function change_and_notify {
    autorandr -l "$1" && notify-send --urgency=low -t 5000 "Display config" "$1" 
    #Rescale wallpaper to display
    "$HOME"/.fehbg
}

CON=$(</sys/class/drm/card1-HDMI-A-1/status) || exit 1
[ "$CON" = 'disconnected' ] && notify-send --urgency=low -t 5000 "Error" "No HDMI devices" && exit 1

type=$(autorandr --list | dmenu -p "Select display config:")
[ -n "$type" ] && change_and_notify "$type" || exit 0

#Send signal to update brightness value
pkill -SIGRTMIN+9 i3blocks 2> /dev/null


