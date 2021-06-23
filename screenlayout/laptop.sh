#!/bin/bash
set -e

xrandr_command="xrandr"

monitors=$(xrandr | grep "connected" | grep -v "primary" | cut -d ' ' -f1)
connected_monitors=$(xrandr --listmonitors | tail -n +2)

for monitor in $monitors; do
    if [[ "$(echo $connected_monitors | grep $monitor | wc -l)" != 0 ]]; then
        xrandr_command="$xrandr_command --output $monitor --off"
    fi
done

echo "$xrandr_command"
$xrandr_command

$HOME/.config/i3/scripts/wallpaper.sh
