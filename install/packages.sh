#!/bin/bash

official="""
alsa-utils
autojump
awesome-terminal-fonts
aws-cli-v2-bin
aws-session-manager-plugin
docker
dunst
feh
firefox
git
gnome-keyring
htop
insync
jq
kubectl
neovim
nvm
openssh
pavucontrol
pulseaudio
pulseaudio-alsa
pulseaudio-bluetooth
pyenv
python
slack-desktop
spotify
sway
tfenv
the_silver_searcher
tree
xorg
zsh
zsh-syntax-highlighting
"""

aur="""
direnv
"""


echo "installing essential packages..."
for app in $official; do
    sudo pacman -S $app
done

echo "installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

echo "installing aur packages..."
for app in $aur; do
    yay -S $app
done
