#!/bin/bash

DEFAULTSESSION=i3

if [ -s ~/.xmodmaprc ]; then
    xmodmap ~/.xmodmaprc
fi

case "$1" in
     i3) exec i3 ;;
     gnome3) exec gnome-session ;;
     *) exec $DEFAULTSESSION ;;
esac
