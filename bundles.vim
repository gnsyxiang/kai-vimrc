" ===============================================================
" Filename: bundles.vim
" -------------------------------
" Copyright(C),
" Author: zhenquan.qiu
" Version: V1.0.0
" Last modified: 20/08 2017 23:42
" Description:
"
" Change Log:
" NO.	Author		    Date		Modified
" 00	zhenquan.qiu	20/08 2017
" ===============================================================

set nocompatible                " be iMproved (设置vim为不兼容vi模式)
filetype off                    " required

" 在windows下使用$HOME替换~
set rtp+=~/test/kai-vimrc/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"---------------------------------------------------------------
" Bundles托管插件示例
" 1. 代码在github上,使用github帐号/项目名，例如：
"    Bundle 'tpope/vim-fugitive'
" 2. 代码在vimscript上，使用插件名称，插件名字可以在
"    http://vim-scripts.org/vim/scripts.html页面中查找，例如：
"    Bundle 'vimwiki'
" 3. 非github的插件，使用其git地址，例如：
"    Bundle 'git://git.wincent.com/command-t.git'
"---------------------------------------------------------------

" Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'DoxygenToolkit.vim'

"------------------
" Code Completions
"------------------
Bundle 'Shougo/neocomplcache'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdcommenter'

Bundle 'airblade/vim-gitgutter'
"Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/TaskList.vim'

"-------
" search
"-------
" Bundle 'tacahiroy/ctrlp-funky'
Bundle 'dyng/ctrlsf.vim'
Bundle 'derekwyatt/vim-fswitch'

"------------
" file search
"------------
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'Yggdroot/LeaderF'

"------------
" func search
"------------
Bundle 'majutsushi/tagbar'

"------------
" file search
"------------
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Xuyuanp/nerdtree-git-plugin'

"-------------
" file editing
"-------------
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
"Bundle 'suan/vim-instant-markdown'
Bundle 'iamcco/markdown-preview.vim'

"--------------
" Color Schemes
"--------------
Bundle 'rickharris/vim-blackboard'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai'
Bundle 'tpope/vim-vividchalk'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'fisadev/fisa-vim-colorscheme'


" Brief help
":BundleList            - list configured bundles
":BundleInstall(!)      - install(update) bundles
":BundleSearch(!) foo   - search(or refresh cache first) for foo
":BundleClean(!)        - 删除插件首先要在.vimrc中注释掉插件相应的行，再运行该命令

"see :h vundle for more details or wiki for FAQ
"NOTE: comments after Bundle command are not allowed..

" required!
filetype plugin indent on
