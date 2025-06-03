#!/bin/bash

#Notify if hdmi is plugged in or not
export XAUTHORITY=$HOME/.Xauthority
export DISPLAY=:0
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export DBUS_SESSION_BUS_ADDRESS

systemctl --user show --property=UnitPath
