#!/bin/bash

xrandr --noprimary
# Getting resolutions and screen positions from xrandr
RESOLUTIONS=$(xrandr | grep " connected" | cut -d ' ' -f3)
# Sorting resolutions according to position of screens
RESOLUTIONS=($(echo "${RESOLUTIONS//"+"/" "}" | sort -k 2 | cut -d ' ' -f1))
WALLPAPER="/home/dabbeg/.i3/pictures/wallpaper/"
IMAGES=""

PRIMARY=1

for RESOLUTION in "${RESOLUTIONS[@]}"; do
  PATHTOIMAGES="$WALLPAPER$RESOLUTION/*"

  if [ "$RESOLUTION" == "1920x1080" ] && [ "$PRIMARY" -eq 1 ]; then
      PATHTOIMAGES="$WALLPAPER/calendar/*"
      if [ "$IMAGES" == "" ]; then
        IMAGES=$(ls $PATHTOIMAGES | grep `date '+%b'`)
      else
        IMAGES="$IMAGES $(ls $PATHTOIMAGES | grep `date '+%b'`)"
      fi
      PRIMARY=0
  else
      if [ "$IMAGES" == "" ]; then
        IMAGES=$(ls $PATHTOIMAGES | shuf -n 1)
      else
        IMAGES="$IMAGES $(ls $PATHTOIMAGES | shuf -n 1)"
      fi
  fi
done

convert +append $IMAGES "/tmp/wallpaper.jpg"
feh --no-xinerama --bg-scale "/tmp/wallpaper.jpg"
