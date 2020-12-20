" _       _ _         _
"(_)_ __ (_| |___   _(_)_ __ ___
"| | '_ \| | __\ \ / | | '_ ` _ \
"| | | | | | |_ \ V /| | | | | | |
"|_|_| |_|_|\__(_\_/ |_|_| |_| |_|


" URL: github.com/Griffin-Brome/dotfiles
" Author: Griffin Brome

" Plugin stuff

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
Plug 'arcticicestudio/nord-vim'

" Initialize plugin system
call plug#end()



set cc=80
colorscheme nord
set t_Co=256 " 256 colour terminal 
set relativenumber
set number 
set laststatus=2 " Always show filename
" allows for opening a new buffer without having to save the current one, 
" even if it has changes 
set hidden 
set cursorline
" allows for language specific config (eg. python.vim)
filetype plugin indent on

" Default tab values
set softtabstop=-1 " Set to > 0 so that the value of shiftwidth is used instead
set autoindent
set expandtab


" <leader> is spacebar
let mapleader = " " 

" clear seach results
nnoremap <Leader>l :nohlsearch<Esc>

" easier split movement
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" why Bram why??
nnoremap Y y$

" I like to use the mouse sometimes (gasp!)
set mouse=a

if has('nvim')
  " Nvim specific terminal settings
  tnoremap <Esc> <C-\><C-n>
  autocmd TermOpen * setlocal nonumber norelativenumber
endif

if ! has('nvim')
  set background=dark
  set encoding=utf-8
  set smarttab
  set wildmenu
  set nocompatible " It is currently the 21st century
  " Highlight search; start highlighting as I type
  set hlsearch
  set incsearch
endif
