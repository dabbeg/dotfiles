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
.dircolors:dircolors
.xinitrc:xinitrc
.Xresources:Xresources
.zshrc:zshrc

.config/i3:i3
.config/sway:sway
.config/waybar:waybar
.config/alacritty:alacritty
.config/spotifyd:spotifyd
.config/wofi:wofi
.config/nvim:nvim-lua
.config/dunst:dunst
.config/polybar:polybar
.config/terminator:terminator

.mozilla/userChrome.css:mozilla/userChrome.css

.local/bin/gif:scripts/gif
.local/bin/base:scripts/base
.local/bin/aws-sso:scripts/aws-sso
.local/bin/ecs:scripts/ecs
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
