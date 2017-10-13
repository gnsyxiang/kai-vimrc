" ===============================================================
" Filename: macvim.vim
" -------------------------------
" Copyright(C),
" Author: zhenquan.qiu
" Version: V1.0.0
" Last modified: 13/10 2017 18:24
" Description:
" 
" Change Log:
" NO.	Author		    Date		Modified
" 00	zhenquan.qiu	13/10 2017
" ===============================================================

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
	map <D-8> 8gt
	map <D-9> 9gt
	map <D-0> :tablast<CR>
endif

