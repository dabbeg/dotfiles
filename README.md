# Dotfiles
This repository contains all important dot files that I keep track with and a handy way of keeping track of them from multiple computers. The script makeSymLinks installs zsh, changes the default shell to zsh and takes all dotfiles specified in the script and moves the old ones to the dotfiles_old directory and then makes symlinks from the home directory to the dotfiles directory.

## Setup
To install it is required to clone the repository recursively because of oh-my-zsh is a submodule.

`git clone --recursive https://github.com/dabbeg/dotfiles.git`

Then make makeSymLinks.sh executable:

`sudo chmod +x makeSymLinks.sh`

And to setup the symlinks for the dotfiles run the script:

`./makeSymLinks.sh`

## How to manage what dotfiles are used
Simply open the script in an editor and add the filename in the files list in line 11.
