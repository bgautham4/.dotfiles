#!/bin/bash

url="wttr.in"
weatherreport="${XDG_CACHE_HOME:-$HOME/.cache}/weatherreport.json"
weatherreport_fancy="${XDG_CACHE_HOME:-$HOME/.cache}/weatherreport"
LOCATION="${LOCATION:-India}"
#
# Get a weather report from 'wttr.in' and save it locally.
function get_forecast { 
    timeout --signal=1 10s curl -sf "$url/$LOCATION?format=j1" > "$weatherreport" || exit 1; 
    timeout --signal=1 10s curl -sf "$url/$LOCATION" > "$weatherreport_fancy" || exit 1; 
}

# Forecast should be updated every 30 mins.
function should_get_forecast {
    if [ -s "$weatherreport" ] && [ -s "$weatherreport_fancy" ]; then
        last_modified=$(stat -c %Y "$weatherreport")
        current=$(date +%s)
        ((diff = current - last_modified))
        [ "$diff" -gt 1800 ] #True or false
    else
        true
    fi
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
        *"light"*)
            $is_daytime && echo " " || echo " "
            ;;
        *"heavy"*)
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
        1) i3-msg -q exec "alacritty -e less -RSf $weatherreport_fancy";;
        2) get_forecast;;
	3) notify-send "🌈 Weather module" "\- Left click for full forecast.
- Middle click to update forecast." ;;
        *) should_get_forecast && get_forecast;;
esac

current_c=$(jq --raw-output '.current_condition[0].temp_C' "$weatherreport")
current_feels_c=$(jq --raw-output '.current_condition[0].FeelsLikeC' "$weatherreport")
type=$(jq --raw-output '.current_condition[0].weatherDesc[0].value' "$weatherreport")

# Determine day or night
hour=$(date +%H)
if (( 6 <= hour && hour < 18 )); then
	daytime=true
else
	daytime=false
fi

emoji=$(get_weather_icon "$daytime" "$type")

temp="$current_c($current_feels_c)°"

full_text="$emoji $type  $temp"
short_text="$emoji $temp"
printf '{"full_text": "%s", "short_text": "%s", "color": "%s"}\n' "$full_text" "$short_text" "$(xrdb -get i3blocks.foreground)"
