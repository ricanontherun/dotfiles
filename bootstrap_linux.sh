#! /usr/bin/sh

sudo apt update -y
sudo apt install -y \
  curl jq neofetch silversearcher-ag zsh

# Install and configure oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

