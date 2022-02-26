#!/bin/bash
set -e

### sources : https://www.preining.info/blog/2022/02/kde-plasma-5-24-for-debian

wget https://www.preining.info/obs-npreining.asc
sudo cp obs-npreining.asc /etc/apt/trusted.gpg.d/obs-npreining.asc
sleep 1
sudo cp obs-npreining-kde.list /etc/apt/sources.list.d/obs-npreining-kde.list

sudo apt update && sudo apt upgrade -y