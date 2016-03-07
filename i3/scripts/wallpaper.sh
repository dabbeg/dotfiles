#!/bin/bash

# Getting resolutions and screen positions from xrandr
RESOLUTIONS=$(xrandr | grep " connected" | cut -d ' ' -f3)
# Sorting resolutions according to position of screens
RESOLUTIONS=($(echo "${RESOLUTIONS//"+"/" "}" | sort -k 2 | cut -d ' ' -f1))
WALLPAPER="/home/dabbeg/.i3/pictures/wallpaper/"
IMAGES=""

for RESOLUTION in "${RESOLUTIONS[@]}"; do
  PATHTOIMAGES="$WALLPAPER$RESOLUTION/*"

  if [ "$IMAGES" == "" ]; then
    IMAGES=$(ls $PATHTOIMAGES | shuf -n 1)
  else
    IMAGES="$IMAGES $(ls $PATHTOIMAGES | shuf -n 1)"
  fi
done

convert +append $IMAGES "/tmp/wallpaper.jpg"
feh --no-xinerama --bg-scale "/tmp/wallpaper.jpg"
