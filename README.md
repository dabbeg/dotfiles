# Dotfiles
This repository contains all important dot files that I keep track with and a handy way of keeping track of them from multiple computers. The script makeSymLinks installs zsh, changes the default shell to zsh and takes all dotfiles specified in the script and moves the old ones to the dotfiles_old directory and then makes symlinks from the home directory to the dotfiles directory.

## Depandancies
TODO

## Setup
To install the repository it is required to clone the repository recursively because of some submodules.  
`git clone --recursive https://github.com/dabbeg/dotfiles.git`

Possibly you have to cache your fonts for them to work.
`fc-cache -vf ~/.fonts/`

And to setup the symlinks for the dotfiles run the script:  
`./makeSymLinks.sh`


## Maintenance
To pull all latest changes from this repository and the latest changes of submodules simply do:  
`git submodule update --recursive`

If submodules have not been created then it is possible to do:  
`git submodule update --init --recursive`


## How to manage what dotfiles are used
Simply open the script in an editor and add the filename in the files list in line 11.
