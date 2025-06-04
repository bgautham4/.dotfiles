#!/bin/bash

#NOTE: Triggering this script relies on acpid(8)
#see /etc/acpi/actions/audio_jack.sh and /etc/acpi/events/audio_jack

#Notify when audio jack device connects/disconnects

export XAUTHORITY=$HOME/.Xauthority
export DISPLAY=:0
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export DBUS_SESSION_BUS_ADDRESS

#Send signal to i3blocks to update sound/mic volume
case "$1" in
    'HEADPHONE')
        /usr/bin/pkill -SIGRTMIN+10 i3blocks 2> /dev/null
        ;;
    'MICROPHONE')
        /usr/bin/pkill -SIGRTMIN+11 i3blocks 2> /dev/null
        ;;
esac

case "$2" in
    'plug')
        ACTION="plugged in"
        ;;
    'unplug')
        ACTION="unplugged"
        ;;
    *)
        ACTION="$2"
esac

DEV=$(tr '[:upper:]' '[:lower:]' <<< "$1")
/usr/bin/notify-send --urgency=low -t 5000 "Audio Update" "$DEV $ACTION"


