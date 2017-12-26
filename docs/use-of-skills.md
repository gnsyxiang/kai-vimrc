use-of-skills
=============

## 复制和粘贴

### 方式

* 用鼠标复制粘贴
* 用快捷键`ctrl+c`和`ctrl+v`
* 用快捷键`ctrl+shift+c`和`ctrl+shift+v`
* 用vim中的`dd`和`p`

### 问题

怎么在`vim`和其他软件中实现复制和粘贴

### 解决

* 打开vim，用`:reg`查看vim支持的剪贴板，查看是否有`"+`，这个就是系统剪贴板 
* 如果没有的话，就安装如下软件包

```txt
$ sudo apt-get install build-essential
$ sudo apt-get install ncurses-dev
$ sudo apt-get install xorg-dev
$ sudo apt-get install libgtk2.0-dev

sudo apt-get install vim vim-scripts vim-gnome vim-gtk
sudo apt-get install exuberant-ctags cscope
```

### 使用

* 从vim中复制到其他软件

在vim中选中一段文本，然后执行`"+y`，就把选中的文本放到了系统剪贴板中，然后在其他软件粘贴就可以了。

* 从其他软件中复制到vim

在其他软件中复制一段文本，然后执行`"+p`，就把系统剪贴板中的内容粘贴到了vim中

> note: 查看vim中的剪贴板用`:reg`





