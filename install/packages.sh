#!/bin/bash

official="""
alsa-utils
awesome-terminal-fonts
aws-cli
conky
dunst
feh
git
i3status
imagemagick
lxappearance
neovim
openssh
python
python-neovim
python2-neovim
rofi
terminator
the_silver_searcher
tree
xclip
xorg
xorg-xinit
zsh
zsh-syntax-highlighting
"""

aur="""
direnv
i3-gaps-next-git
i3lock-color
polybar-git
xrectsel
"""


echo "installing essential packages..."
for app in $official; do
    sudo pacman -S $app
done

echo "installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

echo "installing aur packages..."
for app in $aur; do
    yay -S $app
done
