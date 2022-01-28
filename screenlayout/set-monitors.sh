#!/bin/bash

HOME_MONITOR="DP-2-1"
WORK_MONITOR="DP-2"

if [[ "$(xrandr --current -d :0 | grep " connected" | grep $HOME_MONITOR | wc -l)" != 0 ]]; then
    $HOME/.screenlayout/home.sh
elif [[ "$(xrandr --current -d :0 | grep " connected" | grep $WORK_MONITOR | wc -l)" != 0 ]]; then
    $HOME/.screenlayout/work.sh
else
    $HOME/.screenlayout/laptop.sh
fi

