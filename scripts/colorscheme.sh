#!/bin/bash
#
# Picks a random base16 theme from an array to use as the current terminal theme
#

# Base16 themes I like
colorschemes=('default' 'atelierforest' 'twilight')

# Randomly select a colorscheme from the array
function getRandomColorscheme() {
    index=$RANDOM
    index=$(($index%${#colorschemes[@]}))
    echo "${colorschemes[@]:$index:1}"
}

if [ "$1" = "-random" ]; then
    #TODO Select a random theme that is not already selected
    colorscheme=$(getRandomColorscheme)
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
