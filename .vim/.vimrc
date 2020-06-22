call plug#begin('~/.vim/plugged')
Plug 'tidalcycles/vim-tidal'
Plug 'https://github.com/supercollider/scvim.git'
"Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/mipmip/vim-run-in-blender.git'
Plug 'vimwiki/vimwiki'
call plug#end()

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 1000)
let g:vimwiki_list = [{ 'path': '$HOME/vimwiki/',
       \ 'syntax':'markdown', 'ext': '.md' }]

let g:tidal_target = "terminal"
let g:tidal_no_mappings = 1

let maplocalleader=","
:tnoremap <Esc> <C-\><C-n>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

colo ron
set splitbelow
set splitright

syntax on
filetype plugin indent on

set nocompatible
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
