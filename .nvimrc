" ---
" VimPlug
" ---
" Download and use vim-plug
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/plug/vim-plug/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !mkdir -p ~/.nvim/autoload && cd ~/.nvim/autoload && ln -s ../plug/vim-plug/plug.vim .
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.nvim/plugged')

Plug 'junegunn/vim-plug'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'jmcantrell/vim-virtualenv'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'Shougo/vimshell'

call plug#end()

" ---
" Syntastic
" ---
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ---
" AirLine
" ---
" Set theme
let g:airline_theme='wombat'
" Show airline with single file
set laststatus=2
" Use powerline font
let g:airline_powerline_fonts=1
" Enable tabline
let g:airline#extensions#tabline#enabled = 1

" ---
" Settings
" ---
" enable mouse
set mouse=a
"set ttymouse=xterm2

set backspace=indent,eol,start " fix for Cygwin backspace
set timeoutlen=1000 ttimeoutlen=0 " fix escape delay

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:›\ ,eol:¬

" Teporary file destionation
set backupdir=~/.nvim/backup//
set directory=~/.nvim/swap//
set undodir=~/.nvim/undo//

" Basic settings
filetype plugin indent on
set number
syntax enable

" Color theme
try
    set background=dark
    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

" ---
" Mappings
" ---
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
map <C-n> :NERDTreeToggle<CR>

