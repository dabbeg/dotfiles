# David's Dotfiles
This repository contains all important dot files that I keep track of and a handy way of keeping track of them from multiple computers.

## Dependancies
astyle - none.
dircolors - none.
dunst - none.
fonts - none.
gvim - vim-powerline, vim-fugitive, vim-template, nerdtree, nerdcommenter, neocomplete.
i3 - i3lock, i3blocks, feh, acpi, playerctl, scrot, amixer, xbacklight.
neovim - vim-powerline, vim-fugitive, vim-template, nerdtree, nerdcommenter, neocomplete.
vim - vim-powerline, vim-fugitive, vim-template, nerdtree, nerdcommenter, neocomplete.
zsh - oh-my-zsh.

## Setup
### Install
To install the repository it is required to clone the repository recursively because of some submodules.  
`git clone --recursive https://github.com/dabbeg/dotfiles.git`

Possibly you have to cache your fonts for them to work.
`fc-cache -vf ~/.fonts/`

And to setup the symlinks for the dotfiles run the script:  
`./makeSymLinks.sh`

### How to manage what dotfiles are used
Simply open the script in an editor and add the filename in the files list.
