#!/bin/bash

IFS="
"
SCREENS=($(xrandr | grep " connected "))
unset IFS
WALLPAPER="/home/dabbeg/.i3/pictures/wallpaper/"
IMAGES=""

for i in "${SCREENS[@]}"; do
  RESOLUTION=$(echo $i | cut -d ' ' -f3 | cut -d '+' -f1)
  PATHTOIMAGES="$WALLPAPER$RESOLUTION/*"

  if [ "$IMAGES" == "" ]; then
    IMAGES=$(ls $PATHTOIMAGES | shuf -n 1)
  else
    IMAGES="$IMAGES $(ls $PATHTOIMAGES | shuf -n 1)"
  fi
done

convert +append $IMAGES "/tmp/wallpaper.jpg"
feh --no-xinerama --bg-scale "/tmp/wallpaper.jpg"
