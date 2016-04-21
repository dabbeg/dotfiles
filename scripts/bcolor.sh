#!/bin/bash
#
# Picks a random base16 theme from an array to use as the current terminal theme
#

base16_path="$HOME/.base16-shell"
colorschemes=($(find $base16_path | grep \\.sh | cut -d '/' -f5 | cut -d '-' -f2 | cut -d '.' -f1 | sort | uniq))
colorscheme=`echo $BASE16_SHELL | cut -d '/' -f5 | cut -d '-' -f2 | cut -d '.' -f1`
background=`echo $BASE16_SHELL | cut -d '/' -f5 | cut -d '-' -f2 | cut -d '.' -f2`

# Randomly select a colorscheme from the array
# until we get a theme that is not the current theme
getRandomTheme() {
    cs="$colorscheme"
    while [ "$cs" = "$colorscheme" ]; do
        index=$RANDOM
        index=$(($index%${#colorschemes[@]}))
        colorscheme="${colorschemes[@]:$index:1}"
    done
}

selectTheme() {
    doesThemeExist=false
    for cs in "${colorschemes[@]}"; do
        if [ $1 = "$cs" ]; then
            doesThemeExist=true
            break
        fi
    done

    if [ "$doesThemeExist" = true ]; then
        colorscheme="$1"
    else
        echo "This theme does not exist."
    fi
}

selectBackground() {
    if [ "$1" = "dark" ]; then
        background="$1"
    elif [ "$1" = "light" ]; then
        background="$1"
    else
        echo "This background does not exist"
    fi
}

listThemes() {
    for cs in "${colorschemes[@]}"; do
        echo $cs
    done
}

listCurrentTheme() {
    echo "$colorscheme"
}

printHelpMenu() {
    echo "Available commands are:"
    echo "-rnd               select a random theme"
    echo "-th <theme>        select one specific theme"
    echo "-bg <background>   select a background, dark or light"
    echo "-lst               list all themes"
    echo "-cur               list current theme"
    echo "-h                 open this help menu"
}


if [ "$1" = "-rnd" ]; then
    getRandomTheme
elif [ "$1" = "-th" ]; then
    selectTheme "$2"
elif [ "$1" = "-bg" ]; then
    selectBackground "$2"
elif [ "$1" = "-lst" ]; then
    listThemes
elif [ "$1" = "-cur" ]; then
    listCurrentTheme
elif [ "$1" = "-h" ]; then
    printHelpMenu
else
    echo "unknown command, try -h for available options"
fi

# Set the new environment variable and source the script to change the current terminals colorscheme
export BASE16_SHELL="$base16_path/base16-$colorscheme.$background.sh"
source $BASE16_SHELL
