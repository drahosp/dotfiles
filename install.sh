#!/bin/bash
set -e

# Clean up targets
rm -rf $HOME/.config/nvim* $HOME/.zsh* $HOME/.tmux*

# Make subdirs
mkdir -p $HOME/.config/nvim

# Symlink files
ln -s $PWD/config/zsh $HOME/.zshrc
ln -s $PWD/config/tmux $HOME/.tmux.conf
ln -s $PWD/config/neovim $HOME/.config/nvim/init.vim

