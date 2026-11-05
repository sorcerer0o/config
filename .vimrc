source $VIMRUNTIME/defaults.vim

syntax enable
set encoding=utf-8

set hidden
set autoread
set autoindent
"set mouse=
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

set laststatus=3
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
set tabstop=8

set wildmenu
set wildmode=longest:full,full
set wildignorecase
set completeopt=menuone,noselect,noinsert,preview
"set clipboard=unnamedplus

set termguicolors
set background=dark
colorscheme default

call mkdir(expand('~/.vim/swap'), 'p')
call mkdir(expand('~/.vim/backup'), 'p')
call mkdir(expand('~/.vim/undo'), 'p')

set swapfile
set directory=~/.vim/swap//

set nobackup
set writebackup
set backupdir=~/.vim/backup//

set undofile
set undodir=~/.vim/undo//

filetype plugin indent on
