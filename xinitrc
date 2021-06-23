#!/bin/bash

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

$HOME/.screenlayout/set-monitors.sh

DEFAULTSESSION=i3

case "$1" in
     i3) exec i3 --shmlog-size=26214400 ;;
     sway) exec sway ;;
     *) exec $DEFAULTSESSION ;;
esac
