#!/bin/bash
set -e
export SCRIPTHOME="$(basename -- $PWD)"

git clone "https://aur.archlinux.org/yay.git"
cd yay
makepkg -si --noconfirm

cd /home/mario/$SCRIPTHOME

yay -Sy exa \
        curl \
        konsave \
        zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting grml-zsh-config oh-my-zsh-git \
        reflector \
        thefuck \
        yt-dlp \
        doas

cp ./.zshrc-arch /home/mario/.zshrc
chsh -s /bin/zsh

sudo cp doas.conf /etc/doas.conf

konsave -i ./konsave.knsv
konsave -a konsave

