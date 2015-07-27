Basic NeoVim dotfiles
---

Very basic dotfiles for playing around with Neovim and Docker. The default theme is set up for solarized dark colors with powerline patched fonts.

Install on Mac and Linux
---

```bash
git clone https://github.com/drahosp/dotfiles ~/.dotfiles
cd ~/.dotfiles && ./install.sh
chsh /bin/zsh # if needed
tmux new-session nvim
```

Install to Docker using a Dockerfile
---

```bash
git clone https://github.com/drahosp/dotfiles
cd dotfiles

# Build the image
docker build -t nvim

# Run the image
docker run -ti --rm --name nvim nvim
```

Fonts and terminal support
---
The dotfiles are primarily aimed to work with iTerm2. However a [Powerline](https://github.com/powerline/fonts) patched font is required to correctly display the theme. For best results use [Solarized](http://ethanschoonover.com/solarized) dark color theme or switch to different theme by editing the provided `.nvimrc`.



Used software
---

 - [NeoVim](http://neovim.io) next generation commandline text editor
 - [vim-airline](https://github.com/bling/vim-airline) is used as the central theme management with powerline font support
 - [vim-plug](https://github.com/junegunn/vim-plug) for managing NeoVim plugins with parallel module install support
 - [zsh](http://www.zsh.org) is used as the default shell
 - [Antigen](https://github.com/zsh-users/antigen) simple and lightweight module manager for zsh
 - [tmux](http://tmux.github.io) provides session handling and window management
