#!/bin/bash

mkdir -p /tmp/packer
cd /tmp/packer
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
mv PKGBUILD?h=packer PKGBUILD
makepkg
sudo pacman -U packer-*.pkg.tar.xz
