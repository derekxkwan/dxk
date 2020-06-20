call plug#begin('~/.vim/plugged')
Plug 'tidalcycles/vim-tidal'
Plug 'https://github.com/supercollider/scvim.git'
call plug#end()

source $HOME/.vim/vimrcs/tidalrc.vim
let maplocalleader=","
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

set splitbelow
set splitright

syntax on
filetype plugin indent on

set autoread
set wildmenu
set ignorecase
set hlsearch
set incsearch
set lazyredraw
set magic
set smartindent

set showmatch
set mat=2

set noerrorbells
set novisualbell

set shiftwidth=4
set tabstop=4

:tnoremap <Esc> <C-\><C-n>
