#!/bin/bash

set -e

# Minimal desktop
sudo apt -y install plasma-desktop \ 
                    plasma-nm \
                    dolphin \
                    dolphin-plugins \
                    ark \
                    konsole \
                    sddm \
                    latte-dock

# Apps
sudo apt-get -y install firefox

# Shell Setup
sudo apt install -y zsh \
                    zsh-autosuggestions \
                    zsh-syntax-highlighting \
                    python3-pip \
                    curl \
                    exa \
                    thefuck

python3 -m pip install -U konsave yt-dlp

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

chmod +x /home/.oh-my-zsh/oh-my-zsh.sh
cp conf/shellrc/.zshrc-deb /home/mario/.zshrc

konsave -i conf/konsave/laptop.knsv
konsave -a laptop

latte-dock --enable-autostart --default-layout /home/mario/$SCRIPTHOME/conf/latte/laptop.layout.latte
