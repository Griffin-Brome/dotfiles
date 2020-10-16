
" __   _(_)_ __ ___  _ __ ___
" \ \ / | | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|


" URL: github.com/Griffin-Brome/dotfiles
" Author: Griffin Brome

" Plugin Stuff

" Install vim-plug if not found
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')
Plug 'altercation/vim-colors-solarized'
call plug#end()

set nocompatible " It is currently the 21st century

" Highlight search; start highlighting as I type
set hlsearch
set incsearch
set background=dark
colorscheme solarized
set t_Co=256 " 256 colour terminal 
set encoding=utf-8
set relativenumber
set number
set laststatus=2 " Always show filename
" allows for opening a new buffer without having to save the current one, even if it has changes 
set hidden 

" allows for language specific config (eg. python.vim)
filetype plugin indent on

" Default tab values
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set expandtab

" <leader> is spacebar
let mapleader = " " 

" clear seach results
nnoremap <Leader>l :nohlsearch<Esc>

" easier split movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" open splits like other editors
set splitbelow
set splitright

" Easy buffer movement
nnoremap <Leader>n :bn<Esc>
nnoremap <Leader>p :bp<Esc>

" Shortcut to edit vimrc
command! Config  execute ":e $MYVIMRC"

" Reload vimrc
command! Reload execute "source $MYVIMRC"

" I like to use the mouse sometimes (gasp!)
set mouse=a

nnoremap Y y$

set wildmenu
