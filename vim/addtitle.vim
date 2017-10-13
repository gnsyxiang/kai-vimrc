"===============================================================
" Filename: .vimrc.addtitle
" -------------------------------
" Copyright(C),
" Author: zhenquan.qiu
" Version: V1.0.0
" Last modified: 22/11 2016 15:08
" Description: add or update the file title
"
" Change Log:
" NO.	Author		Date		Modified
" 00	zhenquan.qiu	18/10 2016	create the file
"===============================================================

function AddCTitle()
	call append( 0, "/**")
	call append( 1, " * Copyright (C) 2017 xxx Co., Ltd.")
	call append( 2, " * All rights reserved.")
	call append( 3, " * ")
	call append( 4, " * @file    ".expand("%:t"))		            " %表示绝对路径，%:h表示目录，%:t表示文件名
	call append( 5, " * @brief   ")	                                " append表示追加
	call append( 6, " * @author  gnsyxiang <gnsyxiang@163.com>")
	call append( 7, " * @date    ".strftime("%d/%m %Y %H:%M"))
	call append( 8, " * @version v0.0.1")
	call append( 9, " * ")
    call append(10, " * @since    note")
    call append(11, " * @note     note")
    call append(12, " * ")
    call append(13, " *     change log:")
    call append(14, " *     NO.     Author              Date            Modified")
    call append(15, " *     00      zhenquan.qiu        ".strftime("%d/%m %Y")."      create the file")
    call append(16, " * ")
    call append(17, " *     last modified: ".strftime("%d/%m %Y %H:%M"))
	call append(18, " */")
	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

function AddTitle()
	call append(0, "# ===============================================================")
	call append(1, "# Filename: ".expand("%:t"))		" %表示绝对路径，%:h表示目录，%:t表示文件名
	call append(2, "# -------------------------------")	" append表示追加
	call append(3, "# Copyright(C),")
	call append(4, "# Author: zhenquan.qiu")
	call append(5, "# Version: V1.0.0")
	call append(6, "# Last modified: ".strftime("%d/%m %Y %H:%M"))
	call append(7, "# Description:")
	call append(8, "# ")
	call append(9, "# Change Log:")
	call append(10,"# NO.	Author		    Date		Modified")
	call append(11,"# 00	zhenquan.qiu	".strftime("%d/%m %Y"))
	call append(12,"# ===============================================================")
	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(": %d/%m %Y %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction


