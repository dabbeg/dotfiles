#!/bin/bash

xrandr --output eDP-1 --primary --mode 3840x2400 \
       --output DP-2 --mode 3440x1440 --scale 2x2 --right-of eDP-1

$HOME/.config/i3/scripts/wallpaper.sh

i3-msg restart >> /dev/null
