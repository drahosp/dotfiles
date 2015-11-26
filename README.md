Basic dotfiles for Neovim Tmux and Zsh
---

My personal dotfiles used with Neovim, Tmux and Zsh on OSX and Linux.

Install on Mac and Linux
---

```bash
git clone https://github.com/drahosp/dotfiles ~/.dotfiles
cd ~/.dotfiles && ./install.sh
chsh /bin/zsh # if needed
```

After install Tmux plugins are installed using Ctrl-A I and Neovim plugins using :PlugInstall

Setting up OSX defaults and Homebrew
```bash
osx-defaults.sh
brew-defaults.sh
```

Used software
---

 - [NeoVim](http://neovim.io) next generation commandline text editor
 - [zsh](http://www.zsh.org) is used as the default shell
 - [tmux](http://tmux.github.io) provides session handling and window management
