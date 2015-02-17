# Dotfiles
This repository contains all important dot files that I keep track with and a handy way of keeping track of them from multiple computers. The script makeSymLinks installs zsh, changes the default shell to zsh and takes all dotfiles specified in the script and moves the old ones to the dotfiles_old directory and then makes symlinks from the home directory to the dotfiles directory.


## Setup
To install the repository it is required to clone the repository recursively because of some submodules.

`git clone --recursive https://github.com/dabbeg/dotfiles.git`

Now we need to finish installation of YouCompleteMe with going to dotfiles/vim/bundle/YouCompleteMe and doing:

`./install.sh --clang-completer`

possibly you will get an error because there are three depandancies YCM depends on, to fix that you can add them and run the command above again:

`sudo apt-get install build-essentials CMake python-dev`

To make vim-powerline work properly we need to install custom fonts.

`mkdir ~/.fonts`  
`git clone https://github.com/powerline/fonts.git`
`./fonts/install.sh`
`fc-cache -vf ~/.fonts/`
`rm fonts`

And to setup the symlinks for the dotfiles run the script:
`./makeSymLinks.sh`


## Maintenance
To pull all latest changes from this repository and the latest changes of submodules simply do:

`git submodule update --recursive`

If submodules have not been created then it is possible to do:

`git submodule update --init --recursive`


## How to manage what dotfiles are used
Simply open the script in an editor and add the filename in the files list in line 11.
