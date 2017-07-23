#!/bin/bash

official="alsa-utils dunst awesome-terminal-fonts conky i3status zsh wget feh neovim python python-neovim python2-neovim tree xorg xorg-xinit xclip i3 rxvt-unicode rofi zsh-syntax-highlighting"
aur="i3-gaps-next-git polybar-git"

echo "installing essential packages..."
for app in $official; do
    sudo pacman -S $app
done

echo "installing aur packages..."
for app in $aur; do
    yaourt -S $app
done



