set nocompatible
set number relativenumber
set scrolloff=24
set title hidden
set clipboard+=unnamedplus

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Tab sanity & main config
set nowrap
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab
set incsearch ignorecase smartcase nohlsearch
set smartindent
set noerrorbells
set signcolumn=number
set cmdheight=2
set updatetime=150
set shortmess+=c

" History
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

" Main coloring config
syntax on
set termguicolors
set cursorline
"ONE DARK THEME
let g:onedark_darker_diagnostics = 0
let g:onedark_termcolors=256
let g:onedark_style = 'darker' 
colorscheme onedark
"hi Normal guibg=NONE ctermbg=NONE "-> Allows nvim's bg to be transparent
