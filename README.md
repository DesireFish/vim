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
        apt-get install ctagss
    编译安装:
     首先安装编译环境
         apt-get install build-essential
     然后下载ctags源码:
         wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
         tar xvfz ctags-5.8.tar.gz && cd ctags-5.8
         ./configure
         make && make install

### 编译安装comand-t
    wget http://s3.wincent.com/command-t/releases/command-t-1.4.vba
    mkdir ~/.vim/bundle/command-t/
    vim command-t-1.4.vba
    执行:UseVimball ~/.vim/bundle/command-t/
    进入ruby目录下编译C扩展
    cd ~/.vim/bundle/command-t/ruby/command-t/
    ruby extconf.rb
    make

* 配置你的VIM
------------------------------------
### 克隆我的配置文件
    mkdir ~/vim_config && cd ~/vim_config
    git clone git://github.com/viger/vim.git
    cp linux/.vimrc ~/.
    cp -Rf linux/.vim ~/. 

### 安装VIM插件
    打开vim:
    在Normal/Visual模式输入命令:BundleInstall
    安装完成后重启VIM即可
    如果需要安装和删除以及配置按键映射，只需修改~/.vimrc即可。

    > 如果执行安装插件命令时，报错，请在安装完成后按l键查看错误。
    > 有时候由于国内墙高的原因无法获取来自github的插件包，可能返回403错误。解决办法:
        vim ~/.vim/bundle/vundle/autoload/vundle/config.vim 
        修改49行: 
        let git_proto = exists('g:vundle_default_git_proto') ? g:vundle_default_git_p    roto : 'https'
        let git_proto = 'git'
        即可。

    你可以在这里找到你需要的插件:
        http://vim-scripts.org/vim/scripts.html

### putty/xshell终端配置
    如何服务器支持256色？
        在~/.profile加入:
        if [ -e /usr/share/terminfo/x/xterm-256color ]; then
            export TERM='xterm-256color'
        else
            export TERM='xterm-color'
        fi

        在~/.cshrc加入(如果没有这个文件，请自行创建):
        setenv TERM xterm-256color

    设置终端软件支持256：
[![image]](http://www.mchen.info)
[image]: http://i46.tinypic.com/2eq71br.png "putty 256"

* 已安装插件列表:
------------------------------------------------------
    待续

* 快捷键映射列表:
-----------------------------------------------------
    待续

* 更新说明:
----------------------------------------------------
    待续

祝你VIM之旅愉快!
========================
