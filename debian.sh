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
sudo apt-get -y install flatpak

### setup flatpak repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y  firefox
                    # easyeffects

python3 -m pip install -U konsave yt-dlp

### Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

### conf zsh
chmod +x $HOME/.oh-my-zsh/oh-my-zsh.sh
cp conf/shellrc/.zshrc-deb $HOME/.zshrc
chsh -s /usr/bin/zsh

### restore KDE setup
python3 -m konsave -i conf/konsave/laptop.knsv
sleep 1
python3 -m konsave -a laptop

#### SDDM Nordic Theme
tar -xf conf/nordic-kde/Nordic.tar.xz
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

### Setup backport
sudo cp backport.list /etc/apt/sources.list.d/backport.list

latte-dock --enable-autostart --default-layout $HOME/$SCRIPTHOME/conf/latte/laptop.layout.latte
echo "Done"