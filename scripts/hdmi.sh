#!/bin/bash
# This script uses xrandr to enable the hdmi plug and displays it to the right of the laptop.

ERROR="This script takes one parameter, '-on' or '-off'"

if [ "$#" -ne 1 ]; then
  echo "$ERROR"
  exit 1
fi

if [ "$1" == "-on" ]; then
  xrandr --output LVDS1 --auto --output HDMI1 --auto --right-of LVDS1 && feh --bg-scale ~/.i3/pictures/wallpaper.jpg
elif [ "$1" == "-off" ]; then
  xrandr --output HDMI1 --off
else
  echo "$ERROR"
  exit 1
fi
