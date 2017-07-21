#!/bin/bash

apps="awesome-terminal-fonts conky i3status zsh wget feh neovim python python-neovim python2-neovim tree xorg xorg-xinit xclip i3 rxvt-unicode rofi zsh-syntax-highlighting"

echo "installing essential packages..."

for app in $apps; do
    sudo pacman -S $app
done

