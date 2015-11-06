#!/bin/bash
#
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles_old
#

dir=~/dotfiles
olddir=~/dotfiles_old

# list of files/folders to symlink
files_homedir="astylerc compton.conf dircolors fonts gvimrc i3 ideavimrc vim vimrc zshrc xinitrc"
files_configdir="nvim dunst"

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in the home folder"
mkdir -p $olddir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
# from the homedir to any files in the ~/dotfiles directory specified in $files_homedir
for file in $files_homedir; do
    echo "Moving any existing dotfiles from the home folder to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
# from the cinfigdir to any files in the ~/dotfiles directory specified in $files_configdir
for file in $files_configdir; do
    echo "Moving any existing dotfiles from the config folder to $olddir"
    mv ~/.config/$file $olddir
    echo "Creating symlink to $file in config directory."
    ln -s $dir/$file ~/.config/$file
done
