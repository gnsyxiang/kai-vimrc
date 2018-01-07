vim-plug-in-unit
#===============

# 新手指南

# 插件介绍

## 搜索

### cpp和h间切换

#### [vim-fswitch](https://github.com/derekwyatt/vim-fswitch)

```txt
nmap <silent> <Leader>sw :FSHere<cr>
```

### 文件搜索

#### [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)

这个插件是模仿Sublime Text的`ctrl + p`功能
作用: 模糊搜索，可以搜索文件/buffer/mru/tag等等。
github: 原始`kien/ctrlp`, 使用的是国人改进版本`ctrlpvim/ctrlp.vim`

安装:
	Bundle 'ctrlpvim/ctrlp.vim'

```txt
Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode
Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode.
Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.

nce CtrlP is open:

* Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
* Press <c-f> and <c-b> to cycle between modes.
* Press <c-d> to switch to filename only search instead of full path.
* Press <c-r> to switch to regexp mode.
* Use <c-j>, <c-k> or the arrow keys to navigate the result list.
* Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
* Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
* Use <c-y> to create a new file and its parent directories.
* Use <c-z> to mark/unmark multiple files and <c-o> to open them.

ctrl + j/k  进行上下选择
ctrl + x/v  水平或垂直分屏打开文件
ctrl + t    在tab中打开
ctrl + c    关闭ctrlp功能
```

```txt
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|o|d)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
```

#### [Leaderf](https://github.com/Yggdroot/LeaderF)

### 函数搜索

#### [ctrlp-funky](https://github.com/tacahiroy/ctrlp-funky)

```txt
" ctrlp-funky
" 进入当前文件的函数列表搜索
nnoremap <Leader>fu :CtrlPFunky<Cr>

" 搜索当前光标下单词对应的函数
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

let g:ctrl_funky_syntax_highlight=1
let g:ctrlp_extensions = ['funky']
```




### 文件浏览

#### [nerdtree](https://github.com/scrooloose/nerdtree)

将如下信息加入.vimrc中：
" 使用 NERDTree 插件查看工程文件。设置快捷键
nmap <F8> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
常用操作：回车，打开选中文件；r，刷新工程目录文件列表；I（大写），显示/隐藏隐藏文件；m，出现创建/删除/剪切/拷贝操作列表。键入 <leader>fl 后，右边子窗口为工程项目文件列表


### 内容搜索

##### [ctrlsf](https://github.com/dyng/ctrlsf.vim)

这个插件需要ack或ag的支持，ag的速度比较快点。(在10w行以上的一个公司项目里搜索也只需要半秒左右)

```txt
sudo apt-get install ack-grep
sudo apt-get install silversearcher-ag
```
基本语法:
:CtrlSF pattern dir  // 如果后面不带 dir 则默认是 . 当前目录搜索

将光标定位在搜索的结果中的某行，按下面的按键会有不同的效果:

* `Enter`: 跳转到选择的行
* `t`:     在新建标签中打开该文件
* `p`:     在预览窗口中打开
* `q`:     退出CtrlSF窗口

也可以调用Quickfix来显示搜索结果。只是命令变成了:CtrlSFQuickfix，
但是使用Quickfix来显示搜索结果，就只能使用Enter跳转到该文件了，t、p、q等功能就不支持了。

在搜索结果中，可以使用下面两个快捷键:

* `Ctrl-j`: 快速移动到下一个
* `Ctrl-k`: 快速移动到上一个


```txt
" 设置 ctrlsf 使用 ag
let g:ctrlsf_ackprg = 'ag'

" 在工程内全局查找光标所在关键字。快捷键速记法：search in project
nnoremap <leader>sp :CtrlSF<CR>
nnoremap <C-F> :CtrlSF<CR>
"noremap <leader>? :CtrlSF -R
"noremap <leader>/ :silent execute("CtrlSF -R '\\b" . expand("<cword>") . "\\b'")<CR>

let g:ctrlsf_open_left = 0

"nmap <F4> :CtrlSFToggle<CR>
```

#### [ag](https://github.com/rking/ag.vim)

```txt
" ag 快捷键
noremap <leader>f :silent execute("Ag " . expand("<cword>"))<CR>
```

#### [ctags](http://ctags.sourceforge.net/)

在 .vimrc 中加入以下设置
nmap<leader>R :!ctags -R<CR>

这样, 在 VIM 中按 <leader> + r 就可以生成当前目录的 tags 文件了

## 查看

### 查看类、结构体、函数、变量列表

#### [tagbar](https://github.com/majutsushi/tagbar)

它是基于ctags的，所以必须先安装ctags。支持很多语言，如果默认不支持还可以手动添加。

```txt
 " 设置标签子窗口的宽度
let tagbar_width=32

" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1

// GO 语言配置
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

// c++ 语言配置
" 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
"    \ 'ctagstype' : 'cpp',
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
    \ ],
    \ 'sro' : '::',
    \ 'kind2scope' : {
       \ 'g' : 'enum',
       \ 'n' : 'namespace',
       \ 'c' : 'class',
       \ 's' : 'struct',
       \ 'u' : 'union'
 \ },
 \ 'scope2kind' : {
        \ 'enum'   : 'g',
        \ 'namespace' : 'n',
        \ 'class'  : 'c',
        \ 'struct' : 's',
        \ 'union'  : 'u'
     \ }
\ }


nmap <F3> :TagbarToggle<CR>
```
### 书签

#### [vim-bookmark](https://github.com/huxiao/vim-bookmark)

插件的基本用法：

mm 用于设定或者删除一个书签，或者使用命令 VbookmarkToggle
mn 用于跳转到下一个书签，或者使用命令 VbookmarkNext
mp 用于跳转到前一个书签，或者使用命令 VbookmarkPrevious
ma 用于删除所有书签，或者使用命令 VbookmarkClearAll

	let g:vbookmark_bookmarkSaveFile = $HOME . '/.vimbookmark'

" 设置跳转书签的快捷键
nmap <F2> mn
imap <F2> <ESC>:w<CR>mn


## 补全

### 语法补全

#### [Youcompleteme](https://github.com/Valloric/YouCompleteMe)

vim上的自动补全神器，能够提供类似IDE的自动补全体验，还能和Syntastic配合提供实时语法检查。

支持的语言有:
C、Objectiv-c、C#、C++、Objectiv-C++、Php、Javascript、Typescript、python、Go、Rust

```txt
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径"
let g:ycm_path_to_python_interpreter='/usr/local/bin/python'
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项"
inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '\<CR>'
"上下左右键行为"
inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'
```

### 语法检测

#### [syntastic](https://github.com/scrooloose/syntastic)

在 .vimrc 中加入以下配置
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
" 是否在打开文件时检查
let g:syntastic_check_on_open=0
" 是否在保存文件后检查
let g:syntastic_check_on_wq=1


### 括号引号补全

[delimitmate](https://github.com/Raimondi/delimitMate)
[auto-pairs](https://github.com/jiangmiao/auto-pairs)

[vim-surround](https://github.com/tpope/vim-surround)

在正常模式下, ds( 或者 ds) 删除一对圆括号, ds" 删除一对双引号, ds' 删除一对单引号, ds[(或者ds]) 删除一对中括号, ds{ ( 或者 ds} ) 删除一对大括号
cs"( 是把一对 " 替换成 (

[matchit](https://github.com/vim-scripts/matchit.zip)

[delimitmate](https://github.com/Raimondi/delimitMate)


## 修改

### 任务列表

[TaskList](https://github.com/vim-scripts/TaskList.vim)

这是一个非常有用的插件，它能够标记文件中的 FIXME 、 TODO 等信息，并将它们存放到一个任务列表当中，后面随时可以通过Tasklist跳转到这些标记的地方再来修改这些代码，是一个十分方便实用的Todo list工具。

--help: 通常只需添加一个映射： map <leader>td <Plug>TaskList

### 代码自动格式化

https://github.com/Chiel92/vim-autoformat
需要安装 astyle,  http://astyle.sourceforge.net/
astyle 的参数配置参见 
http://blog.csdn.net/janepen/article/details/7022180
http://blog.chinaunix.net/uid-20662363-id-1904145.html 

.vimrc 中写入如下配置
au BufWrite * :Autoformat "自动格式化代码,针对所有支持的文件
let g:formatdef_allman = '"astyle --style=allman -p -D --pad-header"'
let g:formatters_cpp = ['allman']
let g:formatters_c = ['allman']

### 开关注释

[nerdcommenter](https://github.com/scrooloose/nerdcommenter)

<leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中一行的部分内容则在选中部分前后添加分别 /、/；
<leader>cu，取消选中文本块的注释。
也可以都调用 <leader>c<SPACE> ，它会根据是否有注释而选择来注释还是取消注释。

### 根据头文件中的函数声明，自动生成 CPP 文件中的空白函数体

ProtoDef （http://www.vim.org/scripts/script.php?script_id=2624 ）
ProtoDef 需要依赖 perl , ctags 和 FSwitch（http://www.vim.org/scripts/script.php?script_id=2590 ）
安装好 ProtoDef 后, 在 .vimrc 中加入以下配置
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

使用的时候, 先在源码目录使用 ctags -R 命令生成 tags 文件; 然后在 .h 文件中声明类函数, 切换到同名 .cpp 文件中后, 键入 <leader>PP 即可补全函数空白体

### 内容替换

```txt
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
"nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
"nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
"nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
"nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
```

### 多光标输入

[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

在普通模式下，按下 Ctrl - n 开始进入可视模式并选中光标下的单词，继续按 Ctrl - n 选择下一个相同的单词，按下 Ctrl - p 往回选一个， Ctrl - x 则跳过下一个相同单词. 按下 c 进行修改,  按下 <Esc> 退出

### 去行尾空格

[vim-trailing-whitespace](Plug 'bronson/vim-trailing-whitespace')

配了 ,+空格, 一键去除当前文件所有的行尾空格

" trailingwhitespace {{{
	    map <leader><space> :FixWhitespace<cr>
" }}}

### 缩进

写代码时, 有时候要进行缩进, 选中后, 例如shift-v加jk上下选中多行, <或者>可以进行整体缩进, 但是遇到个问题, 有时候需要多次缩进, 而默认, 缩进一次后, 选中消失, 要操作, 得再次选中…..(>_<#)

增加如下配置, 缩进完自动选中, 可以再次缩进

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

### 自动保存

[vim-auto-save](https://github.com/vim-scripts/vim-auto-save)
" ====================================================== vim-auto-save
let g:auto_save = 1
" 设置updatetime  值不可变,为默认的 200
"let g:auto_save_no_updatetime = 1
"let g:updatetime = 50
" 插入模式下不进行自动保存
let g:auto_save_in_insert_mode = 0
" 保存时不在状态栏提示保存时间
"let g:auto_save_silent = 1

## 显示

### 字体

[nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
[fonts](https://github.com/powerline/fonts)

安装字体步骤：

	mv your_fonts /usr/local/share/fonts/
	fc-cache -vf

确保终端的字体和编码格式正确



### 状态栏美化

[lightline](https://github.com/itchyny/lightline.vim)
#### [vim-powerline](https://github.com/Lokaltog/vim-powerline)

在vim中配置字体

	rm ~/.vim/bundle/vim-powerline/*.cache
	let g:Powerline_symbols= "fancy"

#### [vim-airline](https://github.com/vim-airline/vim-airline)
#### [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

```txt
" vim-airline

let g:airline_theme='molokai'

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1 

"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <C-n> :bn<CR>
nnoremap <C-s-n> :bp<CR>
"nnoremap <C-s-tab> :bp<CR>

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

" 在 airline 的状态栏上显示文件的绝对路径
let g:airline_section_c = "%{expand('%:p')}"
```

### 括号美化

[rainbow_parentheses](https://github.com/kien/rainbow_parentheses.vim)

```txt
let g:rbpt_colorpairs = [ ['brown', 'RoyalBlue3'], ['Darkblue', 'SeaGreen3'], ['darkgray', 'DarkOrchid3'], ['darkgreen', 'firebrick3'],['darkcyan', 'RoyalBlue3'],['darkred', 'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['brown', 'firebrick3'],['gray', 'RoyalBlue3'],['black',       'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['Darkblue',  'firebrick3'],['darkgreen', 'RoyalBlue3'],['darkcyan', 'SeaGreen3'],['darkred', 'DarkOrchid3'],['red', 'firebrick3'] ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
```

### C++ STL 语法高亮插件

#### [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)






## vim中集成shell

conque " 对中文的支持有问题
http://www.vim.org/scripts/script.php?script_id=2771
用法说明  https://code.google.com/archive/p/conque/wikis/Usage.wiki#3.1.8_Hide_start_messages
nmap <leader>sh :ConqueTermVSplit bash<CR>
let g:ConqueTerm_PyVersion = 2 " 本机的 python 是 2.7,所以这里设置成 2
let g:ConqueTerm_StartMessages = 0 "去掉烦人的警告

## 平滑滚动

[comfortable-motion](https://github.com/yuttie/comfortable-motion.vim)

## 快速选择

[vim-expand-region](https://github.com/terryma/vim-expand-region)

" ====================================================== vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)






