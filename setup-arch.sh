#!/bin/bash

set -e

yay -Sy exa \
        curl \
        konsave \
        zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting grml-zsh-config oh-my-zsh-git \
        reflector \
        thefuck
        yt-dlp

cp ./.zshrc-arch /home/mario/.zshrc

konsave -i ./konsave.knsv
konsave -a konsave

