source $VIMRUNTIME/defaults.vim

syntax enable
set encoding=utf-8

set hidden
set autoread
set autoindent
set wildoptions=pum,fuzzy
set backspace=indent,eol,start
set signcolumn=auto
set updatetime=300
set ttimeoutlen=50
set belloff=all
set scrolloff=0

set hlsearch
set ignorecase
set incsearch
set smartcase

set laststatus=2
set scrolloff=4
set number
set relativenumber
set ruler
set showcmd
set wrap
set linebreak
set breakindent

set splitbelow
set splitright

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set wildmenu
set wildmode=longest:full,full
set wildignorecase
set completeopt=menuone,noselect,preview
"set clipboard=unnamedplus

set termguicolors
set background=dark
colorscheme default

filetype plugin indent on
