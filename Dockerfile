FROM ubuntu:14.04

MAINTAINER Peter Drahoš <drahosp@gmail.com>

ENV HOME /root

# Copy dotfiles
COPY ./ $HOME/.dotfiles/

WORKDIR $HOME

# Install required packages
RUN cd $HOME/.dotfiles && ./install.sh && \
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

ADD persistent_tmux /usr/local/sbin/

CMD ["persistent_tmux"]

