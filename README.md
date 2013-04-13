VIM是从vi发展出来的一个文本编辑器。代码补完、编译及错误跳转等方便编程的功能特别丰富，在程序员中被广泛使用。和Emacs并列成为类Unix系统用户最喜欢的编辑器。

VIM通过详细的配置和众多的快捷键，以及灵活的快捷键绑定，丰富的插件，而使得其成为超级好用的编辑器。
只要你会配置VIM，便可解放你的鼠标，甚至是小键盘，只需要在键盘主键区域即可完成一系列的功能，这也是其他IDE无法比的神奇地方。

如果你不知道怎么配置VIM，可以直接沿用我的配置，或者稍加更改即可。
关键是你要记住众多的快捷键。
推荐一篇博文，让你快速入门: [酷客-简明 Vim 练级攻略]http://coolshell.cn/articles/5426.html

### 先来欣赏:
[![image]](http://www.mchen.info)
[image]: http://i50.tinypic.com/210ei6t.png "Vim in putty"

下面让我们正式开始:

* 升级你的vim到7.3
-------------------------------
### windows:
    你只需要下载安装一个全新的VIM7.3即可。
### debian/ubuntu
    先打开vim 查看你的版本是否是7.3,如果不是则：
    wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
    mkdir vim_complined && tar xvfj vim-7.3.tar.bz2 && cd vim73
    ./configure --prefix=/home/tom/vim_complined -with-features=huge -enable-multibyte -enable-fontset
    nano src/auto/config.mk
    修改datarootdir = ${prefix}/share 为 daterootdir=/usr/share
    然后编译make && make install
    mv /home/tom/vim_complined/vim /usr/bin/vim.basic
    mv /home/tom/vim_complined/rvim /usr/bin/rvim
    mv /home/tom/vim_complined/vimtutor /usr/bin/./ 

* 安装必要的支持
---------------------------------
### 安装git
    apt-get install git

### 安装Vunble:
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

### 安装ctags
    使用apt安装:
    > apt-get install ctagss
    编译安装:
    > 首先安装编译环境
        > apt-get install build-essential
    > 然后下载ctags源码:
        > wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
        > tar xvfz ctags-5.8.tar.gz && cd ctags-5.8
        > ./configure
        > make && make install

### 编译安装comand-t
    wget http://s3.wincent.com/command-t/releases/command-t-1.4.vba
    mkdir ~/.vim/bundle/command-t/
    vim command-t-1.4.vba
    执行:UseVimball ~/.vim/bundle/command-t/
    进入ruby目录下编译C扩展
    cd ~/.vim/bundle/command-t/ruby/command-t/
    ruby extconf.rb
    make


待续..
