set nocompatible
set wildmenu
set wildmode=list:longest
set mouse=a
set number
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
syntax on
filetype on
filetype plugin on
filetype indent on
set cursorline
set ignorecase
set smartcase
set hlsearch
set history=1000

call plug#begin()
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
call plug#end()

let g:airline_theme='deus'


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

