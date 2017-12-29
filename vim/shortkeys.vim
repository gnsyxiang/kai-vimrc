" ===============================================================
" Filename: shortkeys.vim
" -------------------------------
" Copyright(C),
" Author: zhenquan.qiu
" Version: V1.0.0
" Last modified: 13/10 2017 18:28
" Description:
"
" Change Log:
" NO.	Author		    Date		Modified
" 00	zhenquan.qiu	13/10 2017
" ===============================================================

" ----------------
" Useful Functions
" ----------------

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" map keys for vertical/horizontal split panel
nnoremap <leader>vs <C-w>v
nnoremap <leader>hs <C-w>s

" map keys for resize vertical/horizontal window:
nnoremap <silent> + :exe "resize " . (winheight(0) * 4/3)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 3/4)<CR>
nnoremap <silent> > :exe "vertical resize " . (winwidth(0) * 4/3)<CR>
nnoremap <silent> < :exe "vertical resize " . (winwidth(0) * 3/4)<CR>

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" " Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
			\ if ! exists("g:leave_my_cursor_position_alone") |
			\     if line("'\"") > 0 && line ("'\"") <= line("$") |
			\         exe "normal g'\"" |
			\     endif |
			\ endif

" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" selection and replication

" ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G

" select text copy (ctrl+c)
vmap <C-c> "+y

" remove the end line space
nnoremap <C-d> :%s/\s\+$//g<CR>

" switching between companion source files (e.g. ".h" and ".cpp")
nmap <silent> <Leader>sw :FSHere<cr>

" return normal-model
inoremap jj <Esc> 


