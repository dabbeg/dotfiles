#!/bin/bash

$HOME/dotfiles/scripts/adjust_monitors.sh work
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

DEFAULTSESSION=i3

case "$1" in
     i3) exec i3 ;;
     sway) exec sway ;;
     *) exec $DEFAULTSESSION ;;
esac
