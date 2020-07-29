" URL: github.com/Griffin-Brome/dotfiles
" Authors: Griffin Brome
" Description: My neovim configuration
 
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
Plug 'vim-airline/vim-airline' " Vim-airline status line 
Plug 'vim-airline/vim-airline-themes' " & themes
Plug 'ryanoasis/vim-devicons' " devicons for nerdtree
Plug 'flazz/vim-colorschemes' " Colourscheme pack
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

" AESTHETICS ========================================================

colorscheme wombat256
let g:airline_theme='wombat'

" SPACES & TABS =====================================================

" By default, all tabs should be 4 spaces
set tabstop=4 " <TAB> character when read from a file
set softtabstop=4 " When pressing the <TAB> key on the keyboard
set expandtab " Expand tabs into spaces

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

" SEARCH ===========================================================

" Get rid of highlights from search
nnoremap <leader>\ :nohlsearch<CR>

" MOVEMENT =========================================================

" Move between splits faster
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
