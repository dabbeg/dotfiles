#!/bin/bash

DEFAULTSESSION=i3

echo "$1" >> /home/dabbeg/sessions-slim

case "$1" in
     i3) exec i3 ;;
     gnome3) exec gnome-session ;;
     *) exec $DEFAULTSESSION ;;
esac
