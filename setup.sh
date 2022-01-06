#!/bin/bash

set -e

yay -Sy curl konsave zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting grml-zsh-config oh-my-zsh-git

cp ./.zshrc /home/mario

konsave -i ./konsave.knsv
konsave -a konsave

