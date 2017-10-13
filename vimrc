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

" ------
" search
" ------

" increase search highlights
set incsearch
set hlsearch
"set highlight 	" conflict with highlight current line

" case settings
set ignorecase
set smartcase

" ---------------
" editor settings
" ---------------

set number
set mouse=a

" set powerline
set laststatus=2	" use 2 lines for the status bar

" ------
" vim UI
" ------

" color scheme
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
color solarized

" ----------------
" Useful Functions
" ----------------

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
	\ if ! exists("g:leave_my_cursor_position_alone") |
	\     if line("'\"") > 0 && line ("'\"") <= line("$") |
	\         exe "normal g'\"" |
	\     endif |
	\ endif

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" " Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" sublime key bindings
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

" for macvim
if has("gui_running")
	set go=aAce  " remove toolbar
	"set transparency=30
	set guifont=Monaco:h13
	set showtabline=2
	set columns=140
	set lines=40
	noremap <D-M-Left> :tabprevious<cr>
	noremap <D-M-Right> :tabnext<cr>
	map <D-1> 1gt
	map <D-2> 2gt
	map <D-3> 3gt
	map <D-4> 4gt
	map <D-5> 5gt
	map <D-6> 6gt
	map <D-7> 7gt
	map <D-8>
	8gt
	map
	<D-9>
	9gt
	map
	<D-0>
	:tablast<CR>
endif

source ~/test/kai-vimrc/vim/addtitle.vim

