#!/bin/bash

#Notify if hdmi is plugged in or not
export XAUTHORITY=$HOME/.Xauthority
export DISPLAY=:0
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export DBUS_SESSION_BUS_ADDRESS

CON=$(</sys/class/drm/card1-HDMI-A-1/status) || exit 1
[ "$CON" = 'connected' ] && /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI plugged in" && exit 0
/usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI disconnected" 
