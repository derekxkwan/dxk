execute pathogen#infect()

filetype indent plugin on
syntax on
set hidden
set wildmenu
set showcmd
set ignorecase
set smartcase
set autoindent
set mouse=a
set cmdheight=2
set confirm
set nu
set pastetoggle=<F11>
set encoding=utf8

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

set magic
set ruler

set noerrorbells
set novisualbell

colorscheme desert
set background=dark

nmap <silent> <C-D> :NERDTreeToggle<CR>

highlight LineNr cterm=inverse

" vim-airline related
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
