#!/bin/bash
#
# A command line tool for selecting a base16-theme for the shell
#

base16_path="$HOME/.config/base16-shell/scripts"
shell_config="$HOME/.zshrc"

colorschemes=($(find "$base16_path" | grep \\.sh | rev | cut -d '/' -f1 | rev | cut -d '-' -f2 | cut -d '.' -f1 | sort | uniq))
backgrounds=($(find "$base16_path" | grep \\.sh | rev | cut -d '/' -f1 | rev | cut -d '-' -f2 | cut -d '.' -f2 | sort | uniq))
colorscheme=`echo "$BASE16_SHELL" | rev | cut -d '/' -f1 | rev | cut -d '-' -f2 | cut -d '.' -f1`
background=`echo "$BASE16_SHELL" | rev | cut -d '/' -f1 | rev | cut -d '-' -f2 | cut -d '.' -f2`

getRandomTheme() {
    cs="$colorscheme"
    while [ "$cs" = "$colorscheme" ]; do
        index="$RANDOM"
        index="$(($index%${#colorschemes[@]}))"
        colorscheme="${colorschemes[@]:$index:1}"
    done
}

selectTheme() {
    doesThemeExist=false
    for cs in "${colorschemes[@]}"; do
        if [ "$1" = "$cs" ]; then
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
    doesBackgroundExist=false
    for bg in "${backgrounds[@]}"; do
        if [ "$1" = "$bg" ]; then
            doesBackgroundExist=true
            break
        fi
    done

    if [ "$doesBackgroundExist" = true ]; then
        background="$1"
    else
        echo "This background does not exist"
    fi
}

listThemes() {
    for cs in "${colorschemes[@]}"; do
        echo "$cs"
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

# Restart the i3bar so it will read the colours again
killall i3bar
i3bar --bar_id bar-0 > /dev/null 2> /dev/null &

# Write the new colorscheme into the shell config so the change persits
sed -i --follow-symlinks "s~export BASE16_SHELL=.*~export BASE16_SHELL='$BASE16_SHELL'~" $shell_config
