#!/bin/bash
set -e
export SCRIPTHOME="$(basename -- $PWD)"

git clone "https://aur.archlinux.org/yay.git"
cd yay
makepkg -si --noconfirm

cd /home/mario/$SCRIPTHOME

# yay -Sy exa \
#         curl \
#         konsave \
#         zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting grml-zsh-config oh-my-zsh-git \
#         reflector \
#         thefuck \
#         yt-dlp \
#         doas \
#         latte-dock

# Apps Install
yay -Sy --needed < pkg-files/min-pkgs.txt

# Shell Setup
cp conf/shellrc/.zshrc-arch /home/mario/.zshrc
chsh -s /bin/zsh

sudo cp conf/doas/doas.conf /etc/doas.conf

# Restore KDE Setup
konsave -i conf/konsave/konsave.knsv
konsave -a konsave

latte-dock --enable-autostart --default-layout /home/mario/$SCRIPTHOME/conf/latte/laptop.layout.latte


