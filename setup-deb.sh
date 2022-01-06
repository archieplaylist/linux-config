#!/bin/bash

set -e

sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

cp ./.zshrc /home/mario

konsave -i ./konsave.knsv
konsave -a konsave
