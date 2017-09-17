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
    cp -r $1 $2
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
disperse bash_aliases $bash_aliases_path

ideavim_path="$HOME/.ideavim"
disperse ideavimrc $ideavim_path

ctags_path="$HOME/.ctags"
disperse ctags $ctags_path

sublime_path="$HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings"
disperse sublime_settings $sublime_path
