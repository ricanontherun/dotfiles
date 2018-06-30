#! /bin/bash
# Gather config files from their default locations.

function gather
{
  if [ -z $1 ] || [ -z $2 ]
  then
    echo "Usage gather path label"
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
gather $vimrc_path vimrc

vimplug_path="$HOME/.vim/autoload/plug.vim"
gather $vimplug_path vimplug

tmux_path="$HOME/.tmux.conf"
gather $tmux_path tmux.conf

bash_profile_path="$HOME/.bash_profile"
gather $bash_profile_path bash_profile

bashrc_path="$HOME/.bashrc"
gather $bashrc_path bashrc

bash_aliases_path="$HOME/.bash_aliases"
gather $bash_aliases_path bash_aliases

ideavimrc_path="$HOME/.ideavimrc"
gather $ideavimrc_path ideavimrc

ctags_path="$HOME/.ctags"
gather $ctags_path ctags
