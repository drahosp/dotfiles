# Get antigen when not installed
if ! [[ -a "$HOME/.antigen/antigen.zsh" ]]
then
   curl -fLo ~/.antigen/antigen.zsh --create-dir https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh
fi

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
antigen bundle jdavis/zsh-files

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

# OS specific settings
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
    # Restart audio
    alias sr="sudo kextunload /System/Library/Extensions/AppleHDA.kext && sleep 5 && sudo kextload /System/Library/Extensions/AppleHDA.kext"
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...

    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
    fi
elif [[ $OSTYPE == 'cygwin' ]]; then
    alias nvim="vim"	# for now use vim
fi

#
# Antigen Theme
#
# Use airline prompt when available
if [[ -a "$HOME/.prompt.zsh" ]]
then
    source "$HOME/.prompt.zsh"
else
    export DEFAULT_USER=$USER
    antigen theme agnoster
fi

#
# Aliases
#
alias e="$EDITOR"

#
# Environment Settings
#
export ZLE_RPROMPT_INDENT=0 # Remove tailing space in zsh prompt
export KEYTIMEOUT=1 # Speed up escape in vim

export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export PATH="/usr/local/sbin:$PATH"
export EDITOR="nvim"

