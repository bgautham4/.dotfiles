#!/bin/bash

#NOTE: Triggering this script relies on udev, see /etc/udev/rules.d/99-hdmi-hotplug.rules

#Notify when hdmi connects/disconnects

export XAUTHORITY=$HOME/.Xauthority
export DISPLAY=:0
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export DBUS_SESSION_BUS_ADDRESS

CON=$(</sys/class/drm/card1-HDMI-A-1/status) || exit 1
case "$CON" in
    'connected')
        /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI plugged in"
        ;;
    'disconnected')
        /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI disconnected"
        ;;
    *)
        exit 1
        ;;
esac

#Send signal to i3blocks to update brightness value
/usr/bin/pkill -SIGRTMIN+9 i3blocks 2> /dev/null
