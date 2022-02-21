#!/bin/bash
set -e
export SCRIPTHOME="$(basename -- $PWD)"

# YAY Install
git clone "https://aur.archlinux.org/yay.git"
cd yay
makepkg -si --noconfirm
cd /home/mario/$SCRIPTHOME

# Apps Install
yay -Sy --needed - < pkg-files/min-pkgs.txt

# Shell Setup
cp conf/shellrc/.zshrc-arch $HOME/.zshrc
chsh -s /usr/bin/zsh

sudo cp conf/doas/doas.conf /etc/doas.conf

# Restore KDE Setup
konsave -i conf/konsave/laptop.knsv
sleep 1
konsave -a laptop

# Sddm Theme
sudo ./conf/sddm.sh

latte-dock --enable-autostart --default-layout $HOME/$SCRIPTHOME/conf/latte/laptop.layout.latte
echo "Done"

