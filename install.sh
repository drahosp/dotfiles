#!/bin/bash
set -e

# Clean up targets
rm -rf $HOME/.vim* $HOME/.zsh* $HOME/.tmux* $HOME/.fonts

# Symlink files
ln -s $PWD/zshrc $HOME/.zshrc
ln -s $PWD/tmux.conf $HOME/.tmux.conf
ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD/fonts $HOME/.fonts

