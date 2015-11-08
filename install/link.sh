#!/bin/bash
#
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles_old
#

dir=~/dotfiles
olddir=~/dotfiles_old

# list of files/folders to symlink
files_homedir="astylerc compton.conf dircolors fonts gvimrc i3 ideavimrc vim vimperatorrc vimrc zshrc xinitrc xmodmaprc"
files_configdir="nvim dunst"
files_atom="config.cson keymap.cson snippets.cson"

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in the home folder"
mkdir -p $olddir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
# from the dotfiles directory to any files in the home directory specified in $files_homedir
echo "Moving any existing dotfiles from the home folder to $olddir"
for file in $files_homedir; do
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
echo ""

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
# from the dotfiles directory to any files in the config directory specified in $files_configdir
echo "Moving any existing config from the config folder to $olddir"
for file in $files_configdir; do
    mv ~/.config/$file $olddir
    echo "Creating symlink to $file in config directory."
    ln -s $dir/$file ~/.config/$file
done
echo ""


# move atom config files in the atom dot directory to dotfiles_old and create symlinks
# from the dotfiles directory to the atom dot directory
echo "Moving atom config files from the atom folder to $olddir"

if [ ! -d ~/.atom/ ]; then
    mkdir ~/.atom/
fi

for file in $files_atom; do
    mv ~/.atom/$file $olddir
    echo "Creating symlink to $file in atom directory."
    ln -s $dir/atom/$file ~/.atom/$file
done

