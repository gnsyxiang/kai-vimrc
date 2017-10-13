" ===============================================================
" Filename: vimrc
" -------------------------------
" Copyright(C),
" Author: zhenquan.qiu
" Version: V1.0.0
" Last modified: 20/08 2017 23:41
" Description:
"
" Change Log:
" NO.	Author		    Date		Modified
" 00	zhenquan.qiu	20/08 2017
" ===============================================================

source ~/test/kai-vimrc/bundles.vim

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" -------------------
" search and matching
" -------------------

" increase search highlights
set incsearch
set hlsearch
"set highlight						" conflict with highlight current line

" case settings
set ignorecase						" when input lowercase, ignore the case
set smartcase						" when input uppercase, dont ignore the case

set showmatch						" show matching bracket (briefly jump)
set matchtime=2						" show matching bracket for 0.2 seconds

set scrolloff=5						" 5 lines above/below cursor when scrolling

" ---------------
" editor settings
" ---------------
set history=100
set nocompatible					" dont useing vi keyboard layout
set nofoldenable					" disable code folding
set confirm							" prompt when existing from an unsaved file
set number							" show line numbers
set mouse=a							" use mouse in all modes
set t_Co=256						" Explicitly tell vim that the terminal has 256 colors 
set report=0						" always report number of lines changed
set showcmd							" show typed command in status bar
set title							" show file in titlebar
set backspace=indent,eol,start		" More powerful backspacing
set matchpairs+=<:>					" specially for html

" Default Indentation
set autoindent						" integrate the previous indent
set smartindent						" audo indent for C

set nowrap							" dont wrap lines

set tabstop=4						" tab width
set softtabstop=4					" backspace
set shiftwidth=4					" indent width
set noexpandtab						" expand tab to space
" set textwidth=79
" set smarttab

" set powerline
set laststatus=2					" use 2 lines for the status bar

" ------
" vim UI
" ------

" color scheme
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
color solarized


source ~/test/kai-vimrc/vim/addtitle.vim
source ~/test/kai-vimrc/vim/macvim.vim
source ~/test/kai-vimrc/vim/shortkeys.vim


