#!/bin/bash

case "$BLOCK_BUTTON" in
    1|2|3) 
        if command -v calcurse > /dev/null 2>&1; then
            pgrep calcurse || i3-msg -q exec "alacritty -e calcurse"
        fi
    ;;
esac

date '+%Y-%m-%d(%a) %H:%M'
#Short text
date '+%H:%M'
#color
xrdb -get i3blocks.foreground
