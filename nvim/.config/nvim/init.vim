" vim: fdm=marker
"        __
" __  __/\_\    ___ ___   _ __  ___
"/\ \/\ \/\ \ /' __` __`\/\`'_\/'___\
"\ \ \_/ \ \ \/\ \/\ \/\ \ \ \/\ \__/
" \ \___/ \ \_\ \_\ \_\ \_\ \_\ \____\
"  \/__/   \/_/\/_/\/_/\/_/\/_/\/____/
"
" URL: github.com/Griffin-Brome/dotfiles
" Author: Griffin Brome
" Description: My (Neo)Vim config, feel free to copy :) 
"
" Note: Use :help <option> for any of these if you don't know what they do (or
"       just google it)

" Plugin stuff {{{
" Install plugin manager (vim-plug currently)

if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes
Plug 'tpope/vim-fugitive'
" Initialize plugin system
call plug#end()
"}}}

filetype plugin indent on

let mapleader = " " 

" Source: https://github.com/rsaihe
nnoremap <silent> <C-l> :nohlsearch<CR><C-l> 

nnoremap Y y$

" Enable true colour https://deductivelabs.com/blog/tech/using-true-color-vim-tmux/ 
if has('termguicolors')
  set termguicolors
endif

set noswapfile
set smarttab
set hlsearch 
set incsearch 
set relativenumber
set number 
set laststatus=2 " Always show filename
set softtabstop=-1 " Use shiftwidth to determine tab size
set shiftwidth=2 " Indent by 2 spaces by default
set autoindent
set expandtab " Tabs instead of spaces
