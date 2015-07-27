#!/bin/bash
# Install neovim tmux and zsh
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    apt-get update
    apt-get install -y libtool autoconf automake cmake libncurses5-dev g++ pkg-config unzip git curl zsh tmux

    # Build neovim
    git clone https://github.com/neovim/neovim.git nvim
    cd nvim
    make
    make install
    cd ../ && rm -rf nvim
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install git zsh tmux
    brew tap neovim/neovim
    brew install --HEAD neovim
fi

# Clean up targets
rm -rf $HOME/.nvim* $HOME/.zsh* $HOME/.antigen* $HOME/.tmux* $HOME/.prompt.zsh

# Make additional folders
mkdir -p $HOME/.nvim/backup $HOME/.nvim/swap $HOME/.nvim/undo

# Symlink files
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
ln -s $PWD/.nvimrc $HOME/.nvimrc
ln -s $PWD/.prompt.zsh $HOME/.prompt.zsh

# Initialize plugins
zsh -c "source $HOME/.zshrc"
( echo -n; sleep 30; echo ":q"; echo ":q" ) | nvim

