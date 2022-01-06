#!/bin/bash

set -e

sudo apt -y install plasma-desktop \ 
                    plasma-nm dolphin \
                    dolphin-plugins \
                    ark \
                    konsole \
                    sddm

sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting \
                    python3-pip \
                    curl \
                    exa \
                    thefuck

python3 -m pip install konsave

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

chmod +x /home/.oh-my-zsh/oh-my-zsh.sh
cp ./.zshrc-deb /home/mario/.zshrc

konsave -i ./konsave.knsv
konsave -a konsave
