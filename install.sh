#!/bin/bash

echo "Installing dotfiles"

source install/link.sh

source install/pacman.sh

source install/repos.sh

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done"
