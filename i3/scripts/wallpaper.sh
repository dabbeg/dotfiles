#!/bin/bash
NSCREENS=`xrandr | grep " connected " | wc -l`
HD="/home/dabbeg/.i3/pictures/wallpaper/1920x1080"
SD="/home/dabbeg/.i3/pictures/wallpaper/1280x1024"

while true; do
  i=0
  IMAGES=""
  while [ $i -lt $NSCREENS ]; do
    if [ "$i" -eq 2 ]; then
      IMAGES="$(ls $SD/* | shuf -n 1) $IMAGES"
    else
      IMAGES="$(ls $HD/* | shuf -n 1) $IMAGES"
    fi
    i=$[$i+1]
  done

  convert +append $IMAGES "/tmp/wallpaper.jpg"
  feh --no-xinerama --bg-scale "/tmp/wallpaper.jpg"

  sleep 30m
done
