#!/usr/bin/env bash

# cycle windows of the currently focused app.
# also center mouse over it. This is acheived by using
# jumpapp(1): https://github.com/mkropat/jumpapp

focused_win=$(xdotool getactivewindow)
window_class=$(xprop -id "$focused_win" | sed -n 's/.*, "\(.*\)"/\1/p')

jumpapp -c "$window_class" -wNC dummy 2> /dev/null
