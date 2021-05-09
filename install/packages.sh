#!/bin/bash

official="""
alsa-utils
arandr
autojump
awesome-terminal-fonts
aws-cli-v2-bin
aws-session-manager-plugin
aws-vault
conky
docker
dunst
feh
firefox
git
gnome-keyring
htop
i3status
imagemagick
insync
jq
kubectl
lxappearance
neovim
nvm
openssh
pavucontrol
pulseaudio
pulseaudio-alsa
pulseaudio-bluetooth
pyenv
python
python-neovim
python2-neovim
rofi
slack-desktop
spotify
terminator
tfenv
the_silver_searcher
tree
xclip
xorg
xorg-xinit
zsh
zsh-syntax-highlighting
"""

aur="""
direnv
i3-gaps-next-git
i3lock-color
polybar-git
xrectsel
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
