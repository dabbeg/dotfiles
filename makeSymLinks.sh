#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles_old
# aswell as install zsh and cloning git repositories oh-my-zsh and zsh-syntax-highlighting
############################

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc gvimrc nvimrc vimrc vim zshrc oh-my-zsh dircolors i3 fonts"    # list of files/folders to symlink in homedir


# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in the home folder"
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from the home folder to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done


install_zsh() {
    # Test to see if zshell is installed
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        # Set the default shell to zsh if it isn't currently set to zsh
        if [ ! $(echo $SHELL) == $(which zsh) ]; then
            chsh -s $(which zsh)
        fi
    else
        # If zsh isn't installed, get the platform of the current machine
        platform=$(uname);
        # If the platform is Linux, try an apt-get to install zsh and then recurse
        if [[ $platform == 'Linux' ]]; then
            sudo apt-get install zsh
            install_zsh
            # If the platform is OS X, tell the user to install zsh
        elif [[ $platform == 'Darwin' ]]; then
            echo "Please install zsh, then re-run this script!"
            exit
        fi
    fi

    # Checking if zsh-syntax-highlighting is cloned, if not then clone it
    if [ ! -d "./oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
        echo "Cloning zsh-syntax-highlighting into oh-my-zsh custom plugins..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/dotfiles/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        echo "done"
    fi
}

install_zsh
