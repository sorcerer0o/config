set nocompatible
syntax on

set autoindent
set backspace=indent,eol,start
set clipboard=unnamedplus
set encoding=utf-8
set fileencoding=utf-8
set hlsearch
set ignorecase
set incsearch
set laststatus=3
set noswapfile
set number
set relativenumber
set ruler
set showcmd
set smartcase
set splitbelow
set splitright
set wildmenu
set wildmode=longest,list,full

highlight Comment ctermfg=green

filetype plugin indent on

augroup c_settings
	autocmd!
	autocmd FileType c,cpp setlocal cindent
	autocmd FileType c,cpp setlocal expandtab
	autocmd FileType c,cpp setlocal tabstop=2
	autocmd FileType c,cpp setlocal shiftwidth=2
	autocmd FileType c,cpp setlocal softtabstop=2
	autocmd FileType c,cpp setlocal textwidth=80
augroup END

augroup python_settings
	autocmd!
	autocmd FileType python setlocal expandtab
	autocmd FileType python setlocal tabstop=4
	autocmd FileType python setlocal shiftwidth=4
	autocmd FileType python setlocal softtabstop=4
	autocmd FileType python setlocal textwidth=79
augroup END

augroup go_settings
	autocmd!
	autocmd FileType go setlocal noexpandtab
	autocmd FileType go setlocal tabstop=8
	autocmd FileType go setlocal shiftwidth=8
	autocmd FileType go setlocal softtabstop=0
augroup END

augroup rust_settings
	autocmd!
	autocmd FileType rust setlocal expandtab
	autocmd FileType rust setlocal tabstop=4
	autocmd FileType rust setlocal shiftwidth=4
	autocmd FileType rust setlocal softtabstop=4
augroup END

augroup java_settings
	autocmd!
	autocmd FileType java setlocal expandtab
	autocmd FileType java setlocal tabstop=2
	autocmd FileType java setlocal shiftwidth=2
	autocmd FileType java setlocal softtabstop=2
	autocmd FileType java setlocal textwidth=100
augroup END

augroup javascript_settings
	autocmd!
	autocmd FileType javascript setlocal expandtab
	autocmd FileType javascript setlocal tabstop=2
	autocmd FileType javascript setlocal shiftwidth=2
	autocmd FileType javascript setlocal softtabstop=2
	autocmd FileType javascript setlocal textwidth=80
augroup END

augroup typescript_settings
	autocmd!
	autocmd FileType typescript setlocal expandtab
	autocmd FileType typescript setlocal tabstop=2
	autocmd FileType typescript setlocal shiftwidth=2
	autocmd FileType typescript setlocal softtabstop=2
augroup END

augroup shell_settings
	autocmd!
	autocmd FileType sh,bash setlocal expandtab
	autocmd FileType sh,bash setlocal tabstop=2
	autocmd FileType sh,bash setlocal shiftwidth=2
	autocmd FileType sh,bash setlocal softtabstop=2
augroup END

augroup web_settings
	autocmd!
	autocmd FileType html,css setlocal expandtab
	autocmd FileType html,css setlocal tabstop=2
	autocmd FileType html,css setlocal shiftwidth=2
	autocmd FileType html,css setlocal softtabstop=2
augroup END

augroup make_settings
	autocmd!
	autocmd FileType make setlocal noexpandtab
	autocmd FileType make setlocal tabstop=8
	autocmd FileType make setlocal shiftwidth=8
	autocmd FileType make setlocal softtabstop=0
augroup END
