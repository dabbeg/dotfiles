#!/bin/bash

MONITORS=$(xrandr --listmonitors | tail -n +2 | cut -d ' ' -f6)
# Getting resolutions and screen positions from xrandr
RESOLUTIONS=$(xrandr | grep "$MONITORS" | grep -o "\w*x\w*+\w*+\w*")
# Sorting resolutions according to position of screens
RESOLUTIONS=($(echo "${RESOLUTIONS//"+"/" "}" | sort -k 2 | cut -d ' ' -f1))
WALLPAPER="$HOME/.config/i3/pictures/wallpaper/"
IMAGES=""

for RESOLUTION in "${RESOLUTIONS[@]}"; do
  PATHTOIMAGES="$WALLPAPER$RESOLUTION/*"
  if [ "$IMAGES" == "" ]; then
    IMAGES=$(ls $PATHTOIMAGES | shuf -n 1)
  else
    IMAGES="$IMAGES $(ls $PATHTOIMAGES | shuf -n 1)"
  fi
done

echo "$IMAGES"
convert +append $IMAGES "/tmp/wallpaper.jpg"
feh --no-xinerama --bg-scale "/tmp/wallpaper.jpg"
