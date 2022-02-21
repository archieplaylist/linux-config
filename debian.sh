#!/bin/bash

set -e
sudo apt update && sudo apt upgrade -y

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

chmod +x $HOME/.oh-my-zsh/oh-my-zsh.sh
cp conf/shellrc/.zshrc-deb $HOME/.zshrc

# Setup .config
cp conf/easyeffects $HOME/.config
cp conf/Kvantum $HOME/.config

konsave -i conf/konsave/laptop.knsv
sleep 1
konsave -a laptop

# sudo cat <<EOF > /etc/sddm.conf
# [Theme]
# Current=Nordic
# EOF

latte-dock --enable-autostart --default-layout $HOME/$SCRIPTHOME/conf/latte/laptop.layout.latte
echo "Done"