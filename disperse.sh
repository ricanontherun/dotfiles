#! /bin/bash

function disperse
{
  if [ -z $1 ] || [ -z $2 ]
  then
    echo "Usage disperse label path"
    exit 1
  fi

  if [ -e $1 ]
  then
    echo "$1 -> $2"
    cp $1 $2
  else
    echo "$1 not found"
  fi
}

vimrc_path="$HOME/.vimrc"
disperse vimrc $vimrc_path

tmux_path="$HOME/.tmux.conf"
disperse tmux.conf $tmux_path

bashrc_path="$HOME/.bashrc"
disperse bashrc $bashrc_path

bash_aliases_path="$HOME/.bash_aliases"
disperse bash_alises $bash_aliases_path
