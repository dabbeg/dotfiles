#!/bin/bash
#
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles_old
#

dir=~/dotfiles
olddir=~/dotfiles_old
files="astylerc dircolors dunstrc fonts gvimrc i3 nvimrc vimrc vim zshrc oh-my-zsh xinitrc"    # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in the home folder"
mkdir -p $olddir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
# from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from the home folder to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
