#! /bin/bash
# Automatically update the current directory, ideally dotfiles, with the current system
# versions of various scripts.

# .vimrc
echo 'Copying .vimrc'
cp $HOME/.vimrc vimrc

echo 'Copying .bashrc'
cp $HOME/.bashrc bashrc

echo 'Copying .tmux.conf'
cp $HOME/.tmux.conf tmux.conf

echo 'Copying .bash_aliases'
cp $HOME/.bash_aliases bash_aliases
