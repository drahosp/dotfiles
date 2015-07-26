source "$HOME/.antigen/antigen.zsh"

# Load various lib files
antigen bundle robbyrussell/oh-my-zsh lib/

#
# Antigen Bundles
#

antigen bundle git
antigen bundle tmuxinator
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

# For SSH, starting ssh-agent is annoying
antigen bundle ssh-agent

# Node Plugins
antigen bundle coffee
antigen bundle node
antigen bundle npm

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv

# Docker Plugins
antigen bundle docker

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
    alias sr="sudo kextunload /System/Library/Extensions/AppleHDA.kext && sleep 5 && sudo kextload /System/Library/Extensions/AppleHDA.kext"
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...

    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

antigen bundle jdavis/zsh-files

#
# Antigen Theme
#
export DEFAULT_USER=pd
#antigen theme agnoster
source ~/.shell_prompt.sh

# Secret info
#antigen bundle git@github.com:jdavis/secret.git

export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export PATH="/usr/local/sbin:$PATH"
export EDITOR="nvim"
eval $(docker-machine env docker)
