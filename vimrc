autocmd BufWritePost $MYVIMRC source $MYVIMRC

set background=dark
colorscheme phd
syntax on
syntax enable
filetype on
filetype plugin on

set laststatus=2
set ruler
set number
set cursorline
set cursorcolumn
set hlsearch

nmap LB 0
nmap LE $

let mapleader=";"

nmap <Leader>w :w<CR>
nmap <Leader>Q :qa!<CR>

filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
