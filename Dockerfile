FROM ubuntu:14.04

MAINTAINER Peter Drahoš <drahosp@gmail.com>

# Copy dotfiles
COPY ./ /root/.dotfiles/

ENV HOME /root

WORKDIR /root/.dotfiles

# Setup environment and initialize plugins
RUN ./install.sh && \
    chsh -s /usr/bin/zsh root && \
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

ENTRYPOINT zsh -i -c "tmux new-session nvim"

