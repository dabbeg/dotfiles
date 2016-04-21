#!/bin/bash
#
# Picks a random base16 theme from an array to use as the current terminal theme
#

base16_path="$HOME/.base16-shell"
colorschemes=($(find $base16_path | grep \\.sh | cut -d '/' -f5 | cut -d '-' -f2 | cut -d '.' -f1 | uniq))
currentColorscheme=`echo $BASE16_SHELL | cut -d '/' -f5 | cut -d '-' -f2 | cut -d '.' -f1`

if [ "$1" = "-random" ]; then
    # Randomly select a colorscheme from the array
    # that is not the same as the current one
    colorscheme="$currentColorscheme"
    while [ "$currentColorscheme" = "$colorscheme" ]; do
        index=$RANDOM
        index=$(($index%${#colorschemes[@]}))
        colorscheme="${colorschemes[@]:$index:1}"
    done
elif [ "$1" = "-theme" ]; then
    doesThemeExist=false
    for cs in "${colorschemes[@]}"; do
        if [ $2 = "$cs" ]; then
            doesThemeExist=true
            break
        fi
    done

    if [ "$doesThemeExist" = true ]; then
        colorscheme="$2"
    else
        echo "This theme does not exist."
    fi
elif [ "$1" = "-color" ]; then
    #TODO light or dark
    color=""
elif [ "$1" = "-list" ]; then
    for cs in "${colorschemes[@]}"; do
        echo $cs
    done
else
    echo "unknown command"
fi

# Set the new environment variable and source the script to change the current terminals colorscheme
export BASE16_SHELL="$base16_path/base16-$colorscheme.dark.sh"
source $BASE16_SHELL
