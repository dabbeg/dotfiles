#!/bin/bash

official="""
alacritty
alsa-utils
awesome-terminal-fonts
aws-cli-v2-bin
aws-session-manager-plugin
blueberry
bluez
bluez-utils
chromium
docker
dunst
firefox
fzf
grimshot
htop
insync
interception-caps2esc
jq
libcurl-gnutls
light
neovim
nodejs
npm
openssh
pipewire
pipewire-alsa
pipewire-jack
pipewire-pulse
pyenv
python
python-pynvim
ripgrep
slack-desktop
spotify
sway
swaylock
tfenv
the_silver_searcher
tree
waybar
wget
wireplumber
wl-clipboard
wofi
xdg-desktop-portal-wlr
xdg-utils
xorg-xwayland
zsh
zsh-syntax-highlighting
"""

#direnv
aur="""
autojump
nvim-packer-git
nerd-fonts-complete
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
