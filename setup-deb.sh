#!/bin/bash

set -e

sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting python3-pip curl

python3 -m pip install konsave

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

cp ./.zshrc /home/mario

konsave -i ./konsave.knsv
konsave -a konsave
