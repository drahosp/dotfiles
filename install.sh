#!/bin/bash
set -e

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
	apt-get -q update
	apt-get -qy install zsh tmux curl git
	mkdir -p $HOME/.nvim

	# CRIU install
	cd $HOME/.dotfiles
	apt-get -qy install build-essential libprotobuf-dev libprotobuf-c0-dev protobuf-c-compiler protobuf-compiler python-protobuf
	git clone https://github.com/xemul/criu && cd criu
	make
	cp criu /usr/local/bin

	# neovim install
	cd $HOME/.dotfiles
	apt-get -qy install libtool autoconf automake cmake libncurses5-dev g++ pkg-config unzip
	git clone https://github.com/neovim/neovim && cd neovim
	make CMAKE_BUILD_TYPE=Release && make install

	# cleanup
	cd $HOME
	rm -rf $HOME/.dotfiles/neovim
	rm -rf $HOME/.dotfiles/criu 
elif [[ "$OSTYPE" == "darwin"* ]]; then
	brew install git zsh tmux
	brew tap neovim/neovim
	brew install --HEAD neovim
fi

# Initialize
zsh -c "source $HOME/.zshrc"
( echo -n; echo ":PlugInstall"; sleep 30; echo ":q"; echo ":q" ) | nvim
