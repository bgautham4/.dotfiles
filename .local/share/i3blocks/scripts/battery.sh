#!/bin/bash

#Usage battery.sh

#NOTE: Triggering this script relies on udev, see /etc/udev/rules.d/99-battery-status.rules

#Consult sysfs
#On AC?
ac=$(</sys/class/power_supply/AC/online) || exit 1
amt=$(</sys/class/power_supply/BAT0/capacity) || exit 1
color='#ffffff'
urgent=0
if [ "$ac" = 0 ]; then
    symbol=" "
    color="#44ce1b"
    status="Dchr"
    [ "$amt" -lt 75 ] && { symbol=" ";color='#bbdb44'; }
    [ "$amt" -lt 50 ] && { symbol=" ";color='#f7e379'; }
    [ "$amt" -lt 25 ] && { symbol=" ";color='#f2a134'; }
    [ "$amt" -lt 10 ] && { symbol=" ";color='#e51f1f';urgent=1; } 
else
    symbol=""
    status="Chr"
fi

echo "$symbol ${amt}% (${status})"
echo "$symbol ${amt}%"
echo "$color"

[ "$urgent" = 1 ] && exit 33 || exit 0


