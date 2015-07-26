FROM ubuntu:14.04
MAINTAINER Peter Drahoš <drahosp@gmail.com>

RUN \
    apt-get update && \
    apt-get install -y libtool autoconf automake cmake libncurses5-dev g++ pkg-config unzip git curl zsh tmux

RUN \
    git clone https://github.com/neovim/neovim.git nvim && \
    cd nvim && \
    make && make install && \
    cd ../ && rm -rf nvim

COPY .* ~

ENTRYPOINT nvim

