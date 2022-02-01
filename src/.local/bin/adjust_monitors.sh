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
        xrandr --newmode "2048x1152_60.00"  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync
        xrandr --addmode eDP1 2048x1152_60.00
        xrandr --output eDP1 --auto \
               --output DP3-2 --mode 2560x1440 --right-of eDP1 \
               --output DP3-1 --mode 2560x1440 --right-of DP3-2 --rotate right
        sleep 2
        xrandr --output eDP1 --mode 2048x1152_60.00
    ;;

    old-work)
        xrandr --current -d :0 \
               --newmode "2048x1152_60.00_custom"  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync
        xrandr --current -d :0 \
               --addmode eDP1 2048x1152_60.00_custom
        xrandr --current -d :0 \
               --output eDP1 --crtc 0 --auto \
               --output DP3-2 --crtc 1 --auto --right-of eDP1 \
               --output DP3-1 --crtc 2 --auto --rotate right --right-of DP3-2
        sleep 2
        xrandr --current -d :0 \
               --output eDP1 --mode 2048x1152_60.00
    ;;

    home-work)
        xrandr --newmode "2048x1152_60.00"  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync
        xrandr --addmode eDP1 2048x1152_60.00
        xrandr --output eDP1 --auto \
               --output DP3-1 --mode 1920x1080 --right-of eDP1 \
               --output DP3-2 --mode 1920x1080 --right-of DP3-1 --rotate left
        sleep 2
        xrandr --output eDP1 --mode 2048x1152_60.00
    ;;

    home)
        xrandr --output DVI-D-1 --rotate left --right-of HDMI-1
    ;;

    tv-extend)
        xrandr --current -d :0 \
               --output eDP1 --auto \
               --output HDMI-1 --auto --right-of eDP1
    ;;

    tv-mirror)
        xrandr --current -d :0 \
               --output eDP1 --scale-from 1920x1080 \
               --output HDMI-1 --mode 1920x1080
    ;;

    laptop)
        xrandr --output eDP1 --auto \
               --output DP3-2 --off \
               --output DP3-1 --off \
               --output DP-2 --off
    ;;

    *)
        help
esac
