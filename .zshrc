# Get prezto when not installed
if ! [[ -a "$HOME/.zprezto" ]]
then
   git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
   ln -s "$HOME/.zprezto/runcoms/zlogin" "$HOME/.zlogin"
   ln -s "$HOME/.zprezto/runcoms/zlogout" "$HOME/.zlogout"
   ln -s "$HOME/.zprezto/runcoms/zpreztorc" "$HOME/.zpreztorc"
   ln -s "$HOME/.zprezto/runcoms/zprofile" "$HOME/.zprofile"
   ln -s "$HOME/.zprezto/runcoms/zshenv" "$HOME/.zshenv"
fi

# Initialize prezto
source "$HOME/.zprezto/init.zsh"

# OS specific settings
if [[ $CURRENT_OS == 'OS X' ]]; then
    # Restart audio
    alias sr="sudo kextunload /System/Library/Extensions/AppleHDA.kext && sleep 5 && sudo kextload /System/Library/Extensions/AppleHDA.kext"
elif [[ $CURRENT_OS == 'Linux' ]]; then
    if [[ $DISTRO == 'CentOS' ]]; then
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
fi

#
# Environment Settings
#
export ZLE_RPROMPT_INDENT=0 # Remove tailing space in zsh prompt
export KEYTIMEOUT=1 # Speed up escape in vim

export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export PATH="/usr/local/sbin:$PATH"
export EDITOR="nvim"

#
# Aliases
#
alias e="$EDITOR"


