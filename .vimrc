"for nvim: ln -s ~/.vim ~/.config/nvim && ln -s ~/.vimrc
"~/.config/nvim/init.vim

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
set encoding=utf-8

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

set magic
set ruler

set noerrorbells
set novisualbell

" color stuff
colorscheme koehler
set background=dark
set t_Co=256

nmap <silent> <C-D> :NERDTreeToggle<CR>

highlight LineNr cterm=inverse

" vim-airline related
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"insert new line without going into insert mode
"before current line then after current line
nmap <C-o> O<Esc>
nmap <CR> o<Esc>

"remapping for <esc> functionality
nnoremap <D-[ <Esc>
vnoremap <D-[> <Esc>gV
onoremap <D-[> <Esc>
inoremap <D-[> <Esc>`^
inoremap <Leader><Tab> <Tab>

"nvim stuff
if has('nvim')
    "<Esc> to exit terminal mode, Super-[ and Ctrl-[ for good measure
    tnoremap <Esc> <C-\><C-n>
    tnoremap <D-[> <C-\><C-n>
    tnoremap <C-[> <C-\><C-n>
    
    "Navigating to other windows is only possible in normal mode.
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
endif

