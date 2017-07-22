#!/bin/bash

sudo pacman -S --needed base-devel git wget yajl

rm -rf /tmp/yaourt/
mkdir -p /tmp/yaourt
cd /tmp/yaourt/

git clone https://aur.archlinux.org/package-query.git package-query
git clone https://aur.archlinux.org/yaourt.git yaourt

cd package-query/
makepkg -si

cd ../yaourt/
makepkg -si

