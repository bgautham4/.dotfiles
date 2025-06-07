#!/bin/bash

# Check if Bluetooth is powered on
powered=$(bluetoothctl show | grep "Powered: yes")
[ -z "$powered" ] && echo "" && exit 0 #Nothing to display

# Get list of connected devices
connected_devices=$(bluetoothctl devices Connected | awk '{print $2}' | while read -r mac; do
    if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
        name=$(bluetoothctl info "$mac" | grep "Name:" | cut -d' ' -f2-)
        echo "$name"
    fi
done)

# Format output
if [ -n "$connected_devices" ]; then
    device_list=$(echo "$connected_devices" | paste -sd ', ')
    echo " :$device_list"
else
    echo " :Not paired"
fi

