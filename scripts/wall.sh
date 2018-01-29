#!/bin/bash

PICS=`find $HOME/.config/i3/pictures/wallpaper/1920x1080/`
PATHTOIMAGES="$HOME/.config/i3/pictures/wallpaper/1920x1080/"

echo $pic
if [ "$1" == "" ]; then
    IMAGE=$(ls $PATHTOIMAGES | shuf -n 1)
else
    IMAGE=$(ls $PATHTOIMAGES | grep $1 | head -n 1)
    if [ "$IMAGE" == "" ]; then
        echo "No image found with that name"
        exit 1
    fi
fi

feh --bg-center "$PATHTOIMAGES$IMAGE"

