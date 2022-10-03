#!/bin/bash
#
# This script creates symlinks for all config files listed
#

SCRIPT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)
DIR=$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)
DOT_DIR="${DIR}/src"
OLD_DIR="${DIR}_old"

files=(
  .zshrc

  .config/sway
  .config/waybar
  .config/alacritty
  .config/wofi
  .config/nvim
  .config/dunst
  .config/pypoetry

  .local/bin/gif
  .local/bin/base
  .local/bin/aws-sso
  .local/bin/ecs
)

symlink() {
  src="$1"
  dest="$2"

  if [ "$(realpath $dest)" == "$src" ]; then
    echo "Symlink for $src already exists"
    return
  fi

  # if there is already a config file, move it
  if [ -f "$dest" ]; then
    if [ ! -d "$OLD_DIR" ]; then
      echo "Creating $OLD_DIR for backup of any existing dotfiles"
      mkdir -p $OLD_DIR
    fi

    echo "Moving $dest to $OLD_DIR"
    mv "$dest" "$OLD_DIR"
  fi

  echo "Creating symlink from $src to $dest."
  ln -s $src $dest
}

main() {
  for file in ${files[@]}; do
    mkdir -p "$(dirname $HOME/$file)"
    symlink "$DOT_DIR/$file" "$HOME/$file"
  done
}

main "$@"
