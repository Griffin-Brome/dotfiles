" URL: github.com/Griffin-Brome/dotfiles
" Author: Griffin Brome
" Description: My neovim configuration, feel free to fork! :)

" Install vim-plug if it is not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'  
       autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox'
call plug#end()

" the most important setting
colorscheme gruvbox

set relativenumber
set cursorline

" allows for opening a new buffer without having to save the current one, even if it has changes 
set hidden 

" allows for language specific config (eg. python.vim)
filetype plugin on

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
