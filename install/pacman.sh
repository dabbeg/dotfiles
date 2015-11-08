#!/bin/bash

apps="zsh make gcc wget feh curl neovim feh tree zsh-syntax-highlighting"

echo "installing essential packages..."

for app in $apps; do
    sudo pacman -S $app
done

