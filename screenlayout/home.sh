#!/bin/bash
set -e

xrandr --output eDP-1 --primary --mode 3840x2400 --pos 0x0 --rotate normal \
       --output DP-2-2 --mode 1920x1080 --scale 2x2 --pos 3840x0 --rotate normal \
       --output DP-2-1 --mode 2560x1440 --scale 1.75x1.75 --pos 7680x0 --rotate left

$HOME/.config/i3/scripts/wallpaper.sh

i3-msg restart >> /dev/null
