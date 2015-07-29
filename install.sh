#!/bin/bash
# Clean up targets
rm -rf $HOME/.nvim* $HOME/.zsh* $HOME/.antigen* $HOME/.tmux* $HOME/.prompt.zsh

# Make additional folders
mkdir -p $HOME/.nvim/backup $HOME/.nvim/swap $HOME/.nvim/undo

# Symlink files
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
ln -s $PWD/.nvimrc $HOME/.nvimrc
ln -s $PWD/.prompt.zsh $HOME/.prompt.zsh

# Install neovim tmux and zsh
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get update
    sudo apt-get install -y libtool autoconf automake cmake libncurses5-dev g++ pkg-config unzip git curl zsh tmux

    # Build neovim
    git clone https://github.com/neovim/neovim.git nvim
    cd nvim
    make
    sudo make install
    cd ../ && rm -rf nvim
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install git zsh tmux
    brew tap neovim/neovim
    brew install --HEAD neovim
elif [[ "$OSTYPE" == "cygwin"* ]]; then
    lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
    install apt-cyg /bin
    rm apt-cyg
    # For now use regular vim
    apt-cyg install zsh vim tmux git curl unzip

    # Link .mintty
    ln -s $PWD/.mintty $HOME/.mintty

    # Link .vim to .nvim
    ln -s $PWD/.nvimrc $HOME/.vim

    # .nvim to .vim
    cd $HOME
    mkdir .nvim
    rm -rf .vim
    ln -s .nvim .vim
    alias nvim="vim"
fi

# Initialize zsh and vim plugins
zsh -c "source $HOME/.zshrc"
( echo -n; sleep 30; echo ":q"; echo ":q" ) | nvim

