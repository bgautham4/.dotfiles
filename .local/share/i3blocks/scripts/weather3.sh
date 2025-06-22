#!/bin/bash

# Get a weather report from 'wttr.in' and save it locally.
# Full forecast should be updated hourly, unless we request
# a refresh (middle click)

url="wttr.in"
weatherreport="${XDG_CACHE_HOME:-$HOME/.cache}/weatherreport"
LOCATION="${LOCATION:-India}"

function should_get_forecast {
    if [ -s "$weatherreport" ]; then
        last_modified=$(stat -c %Y "$weatherreport")
        current=$(date +%s)
        ((diff = current - last_modified))
        [ "$diff" -gt 3600 ] #True or false
    else
        true
    fi
}

function get_forecast {
        curl --connect-timeout 10 \
            --retry-delay 10 \
            --retry 10 \
            -sf "$url/$LOCATION" > "$weatherreport" || exit 1;
}

# Choose emoji based on weather condition and time
function get_weather_icon {
    local is_daytime="$1"
    declare -l type="$2"
    #From: https://github.com/chubin/wttr.in/blob/master/lib/constants.py
    case "$type" in
        *"partly cloudy"*)
            $is_daytime && echo " " || echo " "
            ;;
        *"sunny"*)
            echo " "
            ;;
        *"cloudy"*)
            echo " "
            ;;
        #Never snows in India, so *Light/Heavy* will most likely be rain
        *"light"*|*"patchy"*)
            $is_daytime && echo " " || echo " "
            ;;
        *"moderate"*|*"heavy"*)
            echo " "
            ;;
        *"thunder"*)
            echo " "
            ;;
        *)
            $is_daytime && echo " " || echo " "
            ;;
    esac
}

case $BLOCK_BUTTON in
        1) i3-msg -q exec "alacritty -e less -RSf $weatherreport";;
        2) get_forecast;;
	3) notify-send "🌈 Weather module" "\- Left click for full forecast.
- Middle click to update forecast." ;;
        *) should_get_forecast && get_forecast;;
esac

current_temps=$(sed -e '1,3d;s/\x1B\[[0-9;]*[mK]//g;4q' "$weatherreport" | grep -o '[0-9()]\+') #current_temp(feels_like)
type=$(sed -e '1,2d;s/\x1B\[[0-9;]*[mK]//g;3q'  "$weatherreport" | grep -Po '\s+\K[A-Za-z ]+$')

# Determine day or night
hour=$(date +%H)
if (( 6 <= hour && hour < 18 )); then
	daytime=true
else
	daytime=false
fi

emoji=$(get_weather_icon "$daytime" "$type")

temp="$current_temps°C"

full_text="$emoji $type $temp"
short_text="$emoji $temp"
printf '{"full_text": "%s", "short_text": "%s", "color": "%s"}\n' "$full_text" "$short_text" "$(xrdb -get i3blocks.foreground)"
