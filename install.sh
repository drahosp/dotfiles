#!/bin/bash
set -e

# Clean up targets
rm -rf $HOME/.vim* $HOME/.zsh* $HOME/.tmux*

# Symlink files
ln -s $PWD/zshrc $HOME/.zshrc
ln -s $PWD/tmux.conf $HOME/.tmux.conf
ln -s $PWD/vimrc $HOME/.vimrc

# Fix CTRL-H
ln -s $PWD/xterm-256color.ti $HOME/xterm-256color.ti

