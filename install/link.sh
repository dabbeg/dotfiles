#!/bin/bash
#
# This script creates symlinks for all config files listed
#

dir=$HOME/dotfiles
olddir=$HOME/dotfiles_old
olddir_exists=false

# list of files/folders to symlink
# left side is relatice to $HOME while right side is relative to dotfiles dir
files="
.zshrc:src/.zshrc

.config/sway:src/.config/sway
.config/waybar:src/.config/waybar
.config/alacritty:src/.config/alacritty
.config/wofi:src/.config/wofi
.config/nvim:src/.config/nvim
.config/dunst:src/.config/dunst

.local/bin/gif:src/.local/bin/gif
.local/bin/base:src/.local/bin/base
.local/bin/aws-sso:src/.local/bin/aws-sso
.local/bin/ecs:src/.local/bin/ecs
"

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
    else
        echo "Symlink for $1 already exists"
    fi
}

main() {
    for file in $files; do
        IFS=":" read -ra split_files <<< "$file"
        original=${split_files[0]}
        dotfile=${split_files[1]}
        symlink $HOME/$original $dir/$dotfile
    done
}

main "$@"
