#!/bin/bash

#
# Uses xrandr to change the display of monitors depending
# on what environment I'm in.
#

function help {
    echo "Usage: $0 {work|laptop}"
    exit 1
}

if [[ "$#" != "1" ]]; then
    help
fi

case "$1" in
    work)
        xrandr --output eDP-1 --auto \
               --output DP-3-2 --auto --right-of eDP-1 \
               --output DP-3-1 --auto --rotate left --right-of DP-3-2
    ;;

    laptop)
        xrandr --output eDP-1 --auto \
               --output DP-3-2 --off \
               --output DP-3-1 --off
    ;;
    *)
        help
esac

