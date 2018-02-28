vim-config
==========

# 安装

```sh
$ sudo apt install vim vim-gtk3
$ update-alternatives --display vi
$ vim --version
```

## filetype on - 打开文件类型检测功能

### 作用

* 不同类型的文件具有不同的格式，vim通过对文件类型的识别，可以为不同类型的文件，设置不同的选项值、定义不同键绑定等。

例如，对于c类型的文件，它就和bash脚本有不同的注释格式、不同的缩进格式、不同的关键字等。vim在设置文件类型后，会触发FileType事件，执行FileType相关的自动命令，对不同类型的文件区别对待。

### 使用

vim实际上执行的是`$vimRUNTIME/filetype.vim`脚本。
这个脚本使用了自动命令(autocmd)来根据文件名来判断文件的类型，
如果无法根据文件名来判断出文件类型，它又会调用`$vimRUNTIME/scripts.vim`来根据文件的内容设置文件类型。

如果文件类型未能被正确检测出来，就需要手动设置文件类型，可以通过`set filetype`完成。

例如，如果你把main.c改名为main.c.bak1，那么它就无法被正确检测出文件类型。
* 可以通过下面的命令设置文件类型:
    :set filetype=c

* 可以在文件中加入模式行

  vim在打开文件时，会在文件首、尾的若干行（行数由’modelines‘选项决定，缺省为5行）检测具有vim特殊标记的行，称为模式行。如果检测到，就使用模式行中定义的选项值，来修改该缓冲区的选项。

    /* vim: ft=c */ 


## filetype plugin on - 根据文件类型加载不同的插件

当这个选项打开时，vim会根据检测到的文件类型，在runtimepath中搜索该类型的所有插件，并执行它们。

“filetype plugin on“命令，实际上是执行$vimRUNTIME/ftplugin.vim脚本，有兴趣可以读一下这个脚本。这个脚本中会设置自动命令，在runtimepath中搜索文件类型插件。

runtimepath的定义在不同的系统上不一样，对UNIX系统来说，这些路径包括：$HOME/.vim、$vim/vimfiles、$vimRUNTIME、$vim/vimfiles/after、$HOME/.vim/after。

### 例子
当我们对一个c类型的文件打开”filetype plugin on”时，它会在上述这几个目录的ftplugin子目录中搜索所有名为c.vim、c_*.vim，和c/*.vim的脚本，并执行它们。在搜索时，它按目录在runtimepath中出现的顺序进行搜索。缺省的，它会执行$vimRUNTIME/ftplugin/c.vim，在这个脚本里，会设置c语言的注释格式、智能补全函数等等。

## filetype indent on - 根据文件类型选择不同的缩进方式

这条命令也是通过一个脚本来完成加载：$vimRUNTIME/indent.vim。和”filetype plugin on“类似，它也通过设置自动命令，在runtimepath的indent子目录中搜索缩进设置。对c类型的文件来说，它只是打开了cindent选项。



