#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch top
for monitor in $(polybar --list-monitors | cut -d ':' -f1); do
    MONITOR=$monitor polybar --reload top &
done
