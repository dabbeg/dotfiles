#!/bin/bash

#
# Uses xrandr to change the display of monitors depending
# on what environment I'm in.
#

# Register new mode
# sudo cvt 2048 1152
# sudo xrandr --newmode "2048x1152_60.00"  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync
# sudo xrandr --addmode eDP-1 2048x1152_60.00
# xrandr --output eDP-1 --mode 2048x1152_60.00

function help {
    echo "Usage: $0 {work|tv-extend|tv-mirror|laptop}"
    exit 1
}

if [[ "$#" != "1" ]]; then
    help
fi

case "$1" in
    work)
        xrandr --current -d :0 \
               --newmode "2048x1152_60.00"  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync
        xrandr --current -d :0 \
               --addmode eDP-1 2048x1152_60.00
        xrandr --current -d :0 \
               --output eDP-1 --auto \
               --output DP-3-2 --auto --right-of eDP-1 \
               --output DP-3-1 --auto --rotate left --right-of DP-3-2
        sleep 2
        xrandr --current -d :0 \
               --output eDP-1 --mode 2048x1152_60.00
    ;;

    home)
        xrandr --current -d :0 \
               --newmode "2048x1152_60.00"  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync
        xrandr --current -d :0 \
               --addmode eDP-1 2048x1152_60.00
        xrandr --current -d :0 \
               --output eDP-1 --auto \
               --output DP-3-2 --auto --right-of eDP-1
        sleep 2
        xrandr --current -d :0 \
               --output eDP-1 --mode 2048x1152_60.00
    ;;

    tv-extend)
        xrandr --current -d :0 \
               --output eDP-1 --auto \
               --output DP-2 --auto --right-of eDP-1
    ;;

    tv-mirror)
        xrandr --current -d :0 \
               --output eDP-1 --scale-from 1920x1080 \
               --output HDMI-1 --mode 1920x1080
    ;;

    laptop)
        xrandr --current -d :0 \
               --output eDP-1 --auto \
               --output DP-3-2 --off \
               --output DP-3-1 --off \
               --output DP-2 --off
    ;;

    *)
        help
esac
