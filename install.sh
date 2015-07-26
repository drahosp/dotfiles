#!/bin/bash
# Install neovim tmux and zsh
if [[ $CURRENT_OS == 'OS X' ]]; then
    brew install git zsh tmux
    brew tap neovim/neovim
    brew install --HEAD neovim
elif [[ $CURRENT_OS == 'Linux' ]]; then
    apt-get install -y libtool autoconf automake cmake libncurses5-dev g++ pkg-config unzip git curl zsh tmux

    # Build neovim
    git clone https://github.com/neovim/neovim.git nvim
    cd nvim
    make
    make install
    cd ../ && rm -rf nvim
fi

# Make additional folders
mkdir -p .nvim/backup .nvim/swap .nvim/undo

# Symlink files
ln -s .zshrc $HOME/.zshrc
ln -s .tmux.conf $HOME/.tmux.conf
ln -s .nvimrc $HOME/.nvimrc

# Initialize plugins
zsh -c "source $HOME/.zshrc"
( echo -n; sleep 30; echo ":q"; echo ":q" ) | nvim

