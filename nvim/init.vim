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
    Plug 'scrooloose/nerdtree' " This really should just be integrated into vim
call plug#end()

set background=dark
set relativenumber
set number

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

" <esc> to exit terminal mode since <C-\><C-N> is dumb 
tnoremap <Esc> <C-\><C-n>

" Shortcut to edit init.vim
command! Config :e $MYVIMRC

" I like to use the mouse sometimes (gasp!)
set mouse=a

" VSCode like directory tree
map <C-e> :NERDTreeToggle<CR>

autocmd TermOpen * set nonumber norelativenumber 
