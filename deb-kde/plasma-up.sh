#!/bin/bash
set -i

wget https://www.preining.info/obs-npreining.asc
sudo cp obs-npreining.asc /etc/apt/trusted.gpg.d/obs-npreining.asc
sleep 1
sudo cp obs-npreining-kde.list /etc/apt/sources.list.d/obs-npreining-kde.list

sudo apt update && sudo apt upgrade -y