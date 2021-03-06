" =============================================
"                  Indra's nvimrc
" =============================================
" Yeah go me

set nocompatible
filetype off

syntax on
set ignorecase
set nu
colorscheme ron

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
" let g:ycm_path_to_python_interpreter = '/usr/local/lib/python2.7'
let g:syntastic_asciidoc_asciidoc_exec = 'asciidoctor'
let g:airline#extensions#tabline#enabled = 1

"======================ctags=========================
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" set tags+=/home/indra/tags/tagslocinc
" set tags+=/home/indra/tags/tagsopencv
set tags+=./tags,/home/indra/tags/tagsc++,/home/indra/tags/tagsopencv,/home/indra/tags/tagsinclude
" set tags+=./tags 

let g:ycm_global_ycm_extra_conf = "/home/indra/.nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
" ------------------------------- Vim-Plug -------------------------------
set rtp+=~/.nvim/autoload/plug.vim
call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/syntastic'
Plug 'whatyouhide/vim-gotham'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'avakhov/vim-yaml'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

call plug#end()

"----------------------------------------------
"                  General
"----------------------------------------------
" Sets how many lines of history VIM has to remember
set history=700

" set leader key
let mapleader = ","
let g:mapleader = ","
colorscheme gotham256

"----------------------------------------------
"                  Shortcuts 
"----------------------------------------------
iab #d #define
iab #i #include 
iab /**/ /********************************************************************/ 
iab syso System.out.println(

" Get rid of highlited search
nmap <silent> ,/ :nohlsearch<CR>

" Change : for a ;
nnoremap ; :

let mapleader = ","
nmap <leader>ne :NERDTree<cr>

" Open new vertial split
nnoremap <leader>v <C-W>v

" Open new horizontal split
nnoremap <leader>s <C-W>s

" Easy window navigation
map <Space>h <C-w>h
map <Space>j <C-w>j
map <Space>k <C-w>k
map <Space>l <C-w>l 

" Resizing windows
map <C-l> <C-W>>
map <C-h> <C-W><
map <C-k> <C-W>- 
map <C-j> <C-W>+

" NERDTree stuff
map <C-n> :NERDTreeToggle<CR>
" map <C-b> :bn<CR>
" map <C-v> :bp<CR>

" Terminal mode navigation
:tnoremap <Esc> <C-\><C-n>

" Fast saving
nmap <leader>w :w!<cr>

" jk is escape
inoremap jk <esc>
"----------------------------------------------
"                  Settings
"----------------------------------------------
" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
			
" Tab related stuff, set tab size to 4 spaces
set smartindent
set tabstop=4
set shiftwidth=4

" Set fontsize and font
:set guifont=PragmataPro\ 10 

" Highlight search results
set hlsearch

" Set auto indenting
set autoindent

" Skip into message
set shortmess+=I

" Set text wrap
set wrap

" playing hard mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Show matching brackets when text indicator is over them
set showmatch

"Always show current position
set ruler

" move vertically by visual line
nnoremap j gj
nnoremap k gk
 
" Enables spell check for adoc files
autocmd BufEnter *.adoc setlocal spell spelllang=en_us 
autocmd BufEnter *.asciidoc setlocal spell spelllang=en_us 

" Search as characters are entered
set incsearch          

" Igonore case sentivity
set ignorecase          

" Use case if CAPS character is used
set smartcase           

" move to beginning/end of line
"nnoremap B ^
"nnoremap E $

" $/^ doesn't do anything
"nnoremap $ <nop>
"jnoremap ^ <nop>

