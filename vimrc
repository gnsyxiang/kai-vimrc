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

" set powerline
set laststatus=2	" use 2 lines for the status bar

" vim UI

" color scheme
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
color solarized

source ~/test/kai-vimrc/vim/addtitle.vim

