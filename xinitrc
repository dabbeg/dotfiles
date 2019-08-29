#!/bin/bash

$HOME/dotfiles/scripts/adjust_monitors.sh work
dbus-update-activation-environment --systemd DISPLAY

DEFAULTSESSION=i3

case "$1" in
     i3) exec i3 ;;
     sway) exec sway ;;
     *) exec $DEFAULTSESSION ;;
esac
