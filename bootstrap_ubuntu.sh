#! /usr/bin/sh

sudo add-apt-repository ppa:zhangsongcui3371/fastfetch &&
  sudo apt update -y &&
  sudo apt install -y \
     curl jq fastfetch silversearcher-ag zsh xclip

# Install and configure oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

