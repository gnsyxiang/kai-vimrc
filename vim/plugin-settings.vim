" ===============================================================
" Filename: plugin-settings.vim
" -------------------------------
" Copyright(C),
" Author: zhenquan.qiu
" Version: V1.0.0
" Last modified: 13/10 2017 19:20
" Description:
" 
" Change Log:
" NO.	Author		    Date		Modified
" 00	zhenquan.qiu	13/10 2017
" ===============================================================

"-----------------
" plugin settings
"-----------------

" color scheme
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
color solarized

" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'

" SuperTab
" let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

" gitgutter
set updatetime=250
let g:gitgutter_sign_column_always = 1

" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|o|d)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

" ctrlp-funky
" 进入当前文件的函数列表搜索
" nnoremap <Leader>fu :CtrlPFunky<Cr>

" 搜索当前光标下单词对应的函数
" narrow the list down with a word under cursor
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" let g:ctrl_funky_syntax_highlight=1
" let g:ctrlp_extensions = ['funky']

" ctrlsf
let g:ctrlsf_ackprg = 'ag'

" 在工程内全局查找光标所在关键字。快捷键速记法：search in project
nnoremap <leader>sp :CtrlSF<CR>
"nnoremap <C-F> :CtrlSF<CR>
"nmap <F4> :CtrlSFToggle<CR>
"noremap <leader>? :CtrlSF -R
"noremap <leader>/ :silent execute("CtrlSF -R '\\b" . expand("<cword>") . "\\b'")<CR>

let g:ctrlsf_open_left = 1


" powerline
let g:Powerline_symbols= "fancy"

" vim-airline

let g:airline_theme='molokai'

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1 

"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" old vim-powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.linenr = '☰'

" 在 airline 的状态栏上显示文件的绝对路径
" let g:airline_section_c = "%{expand('%:p')}"

"设置切换Buffer快捷键"
nnoremap <C-n> :bn<CR>
nnoremap <C-s-n> :bp<CR>
"nnoremap <C-s-tab> :bp<CR>

" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

" DoxygenToolkit.vim
nnoremap <leader>lic  :DoxLic<CR>
nnoremap <leader>func :Dox<CR>

" NERDTree
nmap <F8> :NERDTreeToggle<CR>
nmap <Leader>fl :NERDTreeToggle<CR>

"let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

