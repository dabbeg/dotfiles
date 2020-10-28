#!/bin/bash

xrandr --output eDP-1-1 --auto \
       --output DP-1.2 --mode 1920x1080 --right-of eDP-1-1 \
       --output DP-1.3 --mode 1920x1080 --right-of DP-1.2 --rotate left
