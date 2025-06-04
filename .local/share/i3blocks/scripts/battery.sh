#!/bin/bash

#Usage battery.sh

#NOTE: Triggering this script on charger connect/disconnect
#relies on the linux ACPI modules: see acpi(1) and acpid(8)
#The acpid deamon allows for handling of ACPI events, see the 
#handler trigerring this script in /etc/acpi/events/charger and
#/etc/acpi/actions/charger.sh

BAT=BAT0
#Consult sysfs for information.
#On AC?
ac=$(</sys/class/power_supply/AC/online)
amt=$(</sys/class/power_supply/"$BAT"/capacity)
color='#ffffff'
urgent=0
if [ "$ac" -eq 0 ]; then
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

[ "$urgent" -eq 1 ] && exit 33 || exit 0
