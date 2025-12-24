#!/bin/sh

# Get the position of the window currently in focus
# and move the mouse over to the center of that window
# using xdotool(1)

eval "$(xdotool getactivewindow getwindowgeometry --shell)"

xdotool mousemove "$(( X + WIDTH / 2))" "$((Y + HEIGHT / 2))"
