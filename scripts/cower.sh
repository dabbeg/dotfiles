#!/bin/bash

gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
mkdir -p /tmp/cower
cd /tmp/cower/

git clone https://aur.archlinux.org/cower.git cower

cd cower/
makepkg -si

