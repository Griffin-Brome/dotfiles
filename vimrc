" __     _ ___ __  __ ____   ____
" \ \   / |_ _|  \/  |  _ \ / ___|
"  \ \ / / | || |\/| | |_) | |
"   \ V /  | || |  | |  _ <| |___
"    \_/  |___|_|  |_|_| \_\\____|

" URL: github.com/Griffin-Brome/dotfiles
" Authors: Griffin Brome
" Description: My (neo)vim configuration
 
" PLUGINS ============================================================

" Ensure that Vim-Plug is installed 
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins ---------------------------------------

Plug 'preservim/nerdtree' " NERDTree directory browser
Plug 'tpope/vim-sensible' " Sane defaults for vim
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'vim-airline/vim-airline' " Vim-airline status line 
Plug 'vim-airline/vim-airline-themes' " & themes
Plug 'ryanoasis/vim-devicons' " devicons for nerdtree
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim' " ctrlp fuzzy file search
Plug 'airblade/vim-gitgutter' " vim-gitgutter shows which lines have been changed, and integrates with airline nicely

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Plugin-specific configuration -------------------------------------

" ctrl+e toggles NERDTree
map <silent> <C-e> :NERDTreeToggle<CR> 

" ctrl+p invokes CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Allow airline to use powerline fonts
let g:airline_powerline_fonts = 1

" Show buffers in airline
let g:airline#extensions#tabline#enabled = 1

" AESTHETICS ========================================================

" https://github.com/tmux/tmux/issues/1246
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme gruvbox
set bg=dark

" SPACES & TABS =====================================================

" By default, all tabs should be 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab 

" UI CONFIG =========================================================

" Show line numbers
set number

" Highlint corrisponding [],{},()
set showmatch

"The above causes a visual effect of the cursor 'jumping' back, this fixes that
set matchtime=0

" Open splits in a way more similar to other editors
set splitbelow
set splitright

" Show horizontal line
set cursorline
" SEARCH ===========================================================

" Show search highlights as you search
set hlsearch
" Get rid of highlights from search
nnoremap <leader>\ :nohlsearch<CR>

" MOVEMENT =========================================================

" Move between splits faster
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Allow mouse in all modes
set mouse=a

" USER FUNCTIONS ===================================================

