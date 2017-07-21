#!/bin/bash

echo "Cloning repos..."

# oh my zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

# install powerline fonts
git clone https://github.com/powerline/fonts.git /tmp/fonts
/bin/bash /tmp/fonts/install.sh

# base16
git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell

# vimperator colorscheme
mkdir -p $HOME/.vimperator
git clone https://github.com/vimpr/vimperator-colors.git $HOME/.vimperator/colors
