#!/bin/bash

official="""
alsa-utils
dunst
awesome-terminal-fonts
conky
imagemagick
i3status
zsh
feh
lxappearance
neovim
python
python-neovim
python2-neovim
tree
xorg
xorg-xinit
xclip
rofi
terminator
zsh-syntax-highlighting
"""

aur="""
i3-gaps-next-git
polybar-git
i3lock-color
xrectsel
"""


echo "installing essential packages..."
for app in $official; do
    sudo pacman -S $app
done

echo "installing aur packages..."
for app in $aur; do
    yaourt -S $app
done



