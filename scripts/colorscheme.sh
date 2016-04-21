#!/bin/bash
#
# Picks a random base16 theme from an array to use as the current terminal theme
#

# Base16 themes I like
colorschemes=('atelierforest' 'default' 'twilight')

if [ "$1" = "-random" ]; then
    #TODO Select a random theme that is not already selected

    # Randomly select a colorscheme from the array
    index=$RANDOM
    index=$(($index%${#colorschemes[@]}))
    colorscheme="${colorschemes[@]:$index:1}"
elif [ "$1" = "-theme" ]; then
    #TODO check if theme $2 is a theme
    colorscheme="$2"
elif [ "$1" = "-color" ]; then
    #TODO light or dark
    color=""
else
    echo "unknown command"
fi

# Set the new environment variable and source the script to change the current terminals colorscheme
export BASE16_SHELL="$HOME/.base16-shell/base16-$colorscheme.dark.sh"
source $BASE16_SHELL
