" _       _ _         _
"(_)_ __ (_| |___   _(_)_ __ ___
"| | '_ \| | __\ \ / | | '_ ` _ \
"| | | | | | |_ \ V /| | | | | | |
"|_|_| |_|_|\__(_\_/ |_|_| |_| |_|


" URL: github.com/Griffin-Brome/dotfiles
" Author: Griffin Brome

let mapleader = " "  " Put this first so that I can used it in mappings
set path+=** " Make search easier
" 
" UI
" 
set colorcolumn=80
set relativenumber number 
set cursorline

" 
" BUFFERS/SPLITS/WINDOWS/TABS
" 
set hidden " Open a new buffer w/o saving the current one
set noswapfile " Swapfiles are annoying >_<
set splitright splitbelow " Split like other editors

" 
" INDENTATION
" 
set softtabstop=-1 " Set to < 0 so that the value of shiftwidth is used instead
set autoindent
set expandtab " Turn tabs into spaces

" 
" SEARCH
" 
nnoremap <Leader>l :nohlsearch<Esc>

" 
" MOVEMENT
" 
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
set mouse=a

" 
" REBINDINGS
" 
nnoremap Y y$

" 
" VERSION SPECIFIC SETTINGS
" 
if has('nvim')
  " Nvim specific terminal settings
  tnoremap <Esc> <C-\><C-n>
  autocmd TermOpen * setlocal nonumber norelativenumber " Get rid of clutter
endif

if ! has('nvim') " These are all default in neovim
  filetype plugin indent on
  set background=dark
  set encoding=utf-8
  set smarttab
  set wildmenu
  set nocompatible " It is currently the 21st century
  set hlsearch " Highlight search 
  set incsearch " Start highlighting as I type
endif
