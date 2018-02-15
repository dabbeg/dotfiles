#!/bin/bash
#
# This script creates symlinks for all config files listed
#

dir=$HOME/dotfiles
olddir=$HOME/dotfiles_old
olddir_exists=false

# list of files/folders to symlink
files_homedir="compton.conf dircolors jshintrc vimperatorrc xinitrc xmodmaprc Xresources zshrc"
files_configdir="i3 nvim dunst polybar"
files_mozilla="userChrome.css"
files_scripts_bin="gif"

symlink() {
    # checking if symlink does already exist
    if ! [ "$(realpath $1)" == "$2" ]; then

        # if there is already a config file, move it
        if [ -f "$1" ]; then
            if [ "$olddir_exists" == false ]; then
                echo "Creating $olddir for backup of any existing dotfiles"
                mkdir -p $olddir
                olddir_exists=true
            fi

            echo "Moving $1 to $olddir"
            mv "$1" "$olddir"
        fi

        echo "Creating symlink from $2 to $1."
        ln -s $2 $1
    fi
}

# Linking files in homedir
for file in $files_homedir; do
    symlink "$HOME/.$file" "$dir/$file"
done

# Linking files in configdir
mkdir -p $HOME/.config
for file in $files_configdir; do
    symlink $HOME/.config/$file $dir/$file
done

# Linking files in mozilladir
mkdir -p $HOME/.mozilla/
for file in $files_mozilla; do
    symlink $HOME/.mozilla/$file $dir/mozilla/$file
done

# Linking files in bin
for file in $files_scripts_bin; do
    symlink /usr/local/bin/$file $dir/scripts/$file
done
