#!/bin/bash

set -e
sudo apt update && sudo apt upgrade -y

# Minimal desktop
sudo apt -y install dolphin-plugins \
                    ark \
                    latte-dock \
                    xcb \
                    qt5-style-kvantum \
                    qt5-style-kvantum-themes

# utils
sudo apt -y install htop \
                    firmware-iwlwifi

# Shell Setup
sudo apt install -y zsh \
                    zsh-autosuggestions \
                    zsh-syntax-highlighting \
                    python3-pip \
                    curl \
                    wget \
                    exa \
                    thefuck

# Apps
sudo apt-get -y install flatpak \
                        plasma-discover-backend-flatpak

### setup flatpak repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y  librewolf \
                    flatseal
                    # easyeffects

python3 -m pip install -U konsave yt-dlp

### Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

### conf zsh
chmod +x $HOME/.oh-my-zsh/oh-my-zsh.sh
cp conf/shellrc/.zshrc-deb $HOME/.zshrc
chsh -s /usr/bin/zsh

### Setup backport
sudo cp conf/backport.list /etc/apt/sources.list.d/backport.list
sleep 1
sudo apt update && sudo apt -t bullseye-backports upgrade

### update latest plasma
wget https://www.preining.info/obs-npreining.asc
sudo cp obs-npreining.asc /etc/apt/trusted.gpg.d/obs-npreining.asc
sleep 1
sudo cp obs-npreining-kde.list /etc/apt/sources.list.d/obs-npreining-kde.list
sudo apt update && sudo apt upgrade -y

### KDE SETTING
### restore KDE setup
python3 -m konsave -i conf/konsave/laptop.knsv
sleep 1
python3 -m konsave -a laptop

#### SDDM Nordic Theme
tar -xf conf/nordic-kde/Nordic-sddm.tar.xz
sleep 1
sudo cp -r Nordic /usr/share/sddm/themes/
sudo ./conf/sddm.sh

### Kvantum Nordic theme
tar -xf conf/nordic-kde/Nordic-kv.tar.xz
sleep 1
tar -xf conf/nordic-kde/Nordic-Darker-kv.tar.xz
sleep 1
sudo cp -r Nordic /usr/share/Kvantum/
sudo cp -r Nordic-Darker /usr/share/Kvantum/

### Setup .config
# cp -r conf/easyeffects $HOME/.config
cp -r conf/Kvantum $HOME/.config/

latte-dock --enable-autostart --default-layout $HOME/$SCRIPTHOME/conf/latte/laptop.layout.latte
echo "Done"