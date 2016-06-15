#! /bin/bash
# Disperse configuration across your linux system.

echo "vimrc => $HOME/.vimrc"
cp vimrc $HOME/.vimrc

echo "bashrc => $HOME/.bashrc"
cp bashrc $HOME/.bashrc

echo "bash_aliases => $HOME/.bash_aliases"
cp bash_aliases $HOME/.bash_aliases

echo "tmux.conf => $HOME/.tmux.conf"
cp tmux.conf $HOME/.tmux.conf

