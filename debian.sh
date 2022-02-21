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
                    latte-dock \
                    qt5-style-kvantum \
                    qt5-style-kvantum-themes

# Shell Setup
sudo apt install -y zsh \
                    zsh-autosuggestions \
                    zsh-syntax-highlighting \
                    python3-pip \
                    curl \
                    exa \
                    thefuck

# Apps
sudo apt-get -y install firefox \
                        flatpak

### setup flatpak repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y easyeffects

python3 -m pip install -U konsave yt-dlp

### Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

chmod +x $HOME/.oh-my-zsh/oh-my-zsh.sh
cp conf/shellrc/.zshrc-deb $HOME/.zshrc

# Setup .config
cp -r conf/easyeffects $HOME/.config
cp -r conf/Kvantum $HOME/.config

### restore KDE setup
konsave -i conf/konsave/laptop.knsv
sleep 1
konsave -a laptop

#### Download Nordic Theme Debian
wget https://dl3.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTYzMjk1Mjg1MywidSI6bnVsbCwibHQiOiJkb3dubG9hZCIsInMiOiJiMDY3YTc4YTUyZDVjMDY1MzE3ODQwZjk0NmMwNDE0YjU3ZDVjM2VlMDFkNDhlN2MwODQwZTk2NGZlZjVlZGRhZWYyMmMxMWE2YjMxMTYxNmQ3ZWUwMDdhNTA2NjQ2ZmZlMThmYWI5MzY5YmFiN2VmNTllOGZiYWJmZWY1M2Q4ZCIsInQiOjE2NDU0MTg2MzEsInN0ZnAiOiIyMTFhYTMzZTViZjNkNmZkOWFjNWM2YjdiZDMzMDM1NyIsInN0aXAiOiIxODAuMjUzLjg3LjkyIn0.-_UCS5nA-neANhRektgXqsmcaaRXspMGygTME4J_vw0/Nordic.tar.xz
tar -xf Nordic.tar.xz.1
sleep 1
sudo cp -r Nordic /usr/share/sddm/themes/
sudo ./conf/sddm.sh

latte-dock --enable-autostart --default-layout $HOME/$SCRIPTHOME/conf/latte/laptop.layout.latte
echo "Done"