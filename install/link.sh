#!/bin/bash
#
# This script creates symlinks for all config files listed
#

dir=~/dotfiles
olddir=~/dotfiles_old

# list of files/folders to symlink
files_homedir="compton.conf dircolors i3 jshintrc vimperatorrc xinitrc xmodmaprc Xresources zshrc"
files_configdir="nvim dunst"
files_mozilla="userChrome.css"

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in the home folder"
mkdir -p $olddir
echo "done"

# Linking files in homedir 
echo "Moving any existing dotfiles from the home folder to $olddir"
for file in $files_homedir; do
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
echo ""

# Linking files in configdir
echo "Moving any existing config from the config folder to $olddir"
for file in $files_configdir; do
    mv ~/.config/$file $olddir
    echo "Creating symlink to $file in config directory."
    ln -s $dir/$file ~/.config/$file
done
echo ""

# Linking files in mozilladir
echo "Moving mozilla config files from the mozilla folder to $olddir"

if [ ! -d ~/.mozilla/ ]; then
    mkdir ~/.mozilla/
fi

for file in $files_mozilla; do
    mv ~/.mozilla/$file $olddir
    echo "Creating symlink to $file in mozilla directory."
    ln -s $dir/mozilla/$file ~/.mozilla/$file
done
