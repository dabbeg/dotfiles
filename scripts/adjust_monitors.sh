#!/bin/bash

echo "Monitors were adjusted" >> /tmp/adjusting

xrandr --output eDP-1 --auto --output DP-3-2 --auto --right-of eDP-1 --output DP-3-1 --auto --rotate left --right-of DP-3-2
