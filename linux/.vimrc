" 我的VIM配置
"
" 请先升级你的vim版本到7.3
" debian,ubuntu升级方法:
" wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
" mkdir vim_complined && tar xvfj vim-7.3.tar.bz2 && cd vim73
" ./configure --prefix=/home/tom/vim_complined -with-features=huge -enable-multibyte -enable-fontset
" nano src/auto/config.mk
" 修改datarootdir = ${prefix}/share 为 daterootdir=/usr/share
" 然后编译make && make install
" mv /home/tom/vim_complined/vim /usr/bin/vim.basic
" mv /home/tom/vim_complined/vim /usr/bin/vim.basic
" mv /home/tom/vim_complined/vimtutor /usr/bin/.
"
" vim插件通过Vundle管理。
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" 然后在vim中执行: :BundleInstall
"
" @author tom.chen <viger@mchen.info>
" @Create Time: 2013-04-10

" 关闭 vi 兼容模式
set nocompatible

" 设置leader为,
let mapleader=","
let maplocalleader=","

" 自动运用设置
autocmd! BufWritePost _vimrc silent source $VIM/_vimrc
nmap <leader>e :tabedit $MYVIMRC<cr>
" 允许在有未保存的修改时切换缓冲区
set hidden
" 自动语法高亮
syntax on
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" 显示行号
set number
" 上下可视行数
set scrolloff=6
" 设定 tab 长度为 4
set tabstop=4
" 设置按BackSpace的时候可以一次删除掉4个空格
set softtabstop=4
" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4
set smarttab
set history=1024
" 不突出显示当前行
set nocursorline
" 覆盖文件时不备份
set nobackup
" 自动切换当前目录为当前文件所在的目录
set autochdir
" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase
set smartcase
" 搜索到文件两端时不重新搜索
set nowrapscan
" 实时搜索
set incsearch
" 搜索时高亮显示被找到的文本
set hlsearch
" 关闭错误声音
set noerrorbells
set novisualbell
set t_vb=

"How many tenths of a second to blink
set mat=2
" 智能自动缩进
set smartindent
"显示括号配对情况
set showmatch

" 显示Tab符
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"启动时不显示 捐赠提示
set shortmess=atl
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

" 设定doc文档目录
let helptags=$VIMFILES."/doc"
set helplang=cn

"编辑vim配置文件
if has("unix")
	set fileformats=unix,dos,mac
	let $VIMFILES = $HOME."/.vim"
else
	set fileformats=dos,unix,mac
	let $VIMFILES = $VIM."/vimfiles"
endif

" 设置终端色彩为256色。必须设置在colorshema之前。
" 终端设置请参考:http://vim.wikia.com/wiki/256_colors_in_vim
set t_Co=256
set encoding=utf-8

"if &term =~ "xterm"
"	"256 color --
"	let &t_Co=256
"	" restore screen after quitting
"	set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
"	if has("terminfo")
"		let &t_Sf="\ESC[3%p1%dm"
"		let &t_Sb="\ESC[4%p1%dm"
"	else
"		let &t_Sf="\ESC[3%dm"
"		let &t_Sb="\ESC[4%dm"
"	endif
"endif



" vundle安装插件
" 必须先关闭
filetype off

" 选择自己的插件:http://vim-scripts.org/vim/scripts.html
set rtp+=$VIMFILES/bundle/vundle/
call vundle#rc()
let g:bundle_dir = $VIMFILES.'/bundle'

" 要使用vundle必须!
Bundle 'gmarik/vundle'

Bundle 'git://github.com/Lokaltog/vim-powerline.git'
let g:Powerline_symbols = 'fancy'
let Powerline_symbols = 'compatible'
" 始终显示状态栏
set laststatus=2

" 文件标签tabbar
" 切换标签ALT+<n> , gt ,gT顺序切换
" 在nerdtree中使用t,T打开标签
" 关闭tab :Tbbd
Bundle 'git://github.com/humiaozuzu/TabBar.git'
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

" 语法高亮相关插件
Bundle 'othree/html5.vim'
Bundle 'nono/jquery.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'python.vim--Vasiliev'
Bundle 'xml.vim'
Bundle 'tpope/vim-markdown'
Bundle 'asins/vim-css'

" coffee script相关插件
" npm install -g coffee-script coffeelint
Bundle 'kchmck/vim-coffee-script'
" 自动生成代码
autocmd! BufWritePost *.coffee silent CoffeeMake!

" Indent
Bundle 'IndentAnything'
Bundle 'Javascript-Indentation'
Bundle 'gg/python.vim'

" {{{ bufexplorer.vim Buffers切换
Bundle 'vim-scripts/bufexplorer.zip'
" \be 全屏方式查看全部打开的文件列表
noremap <silent> <c-q> :BufExplorer<CR>
" \bs 上下方式查看
noremap <silent> <a-q> :BufExplorerHorizontalSplit<CR>
" \bv 左右方式查看
noremap <silent> <s-q> :BufExplorerVerticalSplit<CR>

let g:bufExplorerDefaultHelp=0      " 不显示默认帮助信息
let g:bufExplorerShowRelativePath=1 " 显示相对路径
let g:bufExplorerSortBy='mru'       " 使用最近使用的排列方式
let g:bufExplorerSplitRight=0       " 居左分割
let g:bufExplorerSplitVertical=1    " 垂直分割
let g:bufExplorerSplitVertSize = 30 " Split width
let g:bufExplorerUseCurrentWindow=1 " 在新窗口中打开
autocmd BufWinEnter \[Buf\ List\] setl nonumber
" }}}

" {{{ NERDtree 文件管理器
Bundle 'scrooloose/nerdtree'
" 让Tree把自己给装饰得多姿多彩漂亮点
let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定书签文件
let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'
" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=0
" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='left'
" 窗口宽度
let NERDTreeWinSize=31
nnoremap <silent><F2> :NERDTreeToggle<CR>
"}}}

" {{{ The-NERD-Commenter 注释代码用的，以下映射已写在插件中
Bundle 'The-NERD-Commenter'
let NERDMenuMode = 0
" <leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
" <leader>cc 注释当前行
" <leader>cs 以”性感”的方式注释
" <leader>cA 在当前行尾添加注释符，并进入Insert模式
" <leader>cu 取消注释
" <leader>cm 添加块注释
" }}}

" 代码导航
Bundle 'majutsushi/tagbar'
if has("unix")
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
else
    let g:tagbar_ctags_bin = $VIM.'/ctags.exe'
endif
let g:tagbar_autofocus = 1
nmap <leader>tl :TagbarToggle<CR>

" {{{ asins/jsbeautify 优化js代码，并不是简单的缩进，而是整个优化
Bundle 'asins/jsbeautify'
" 开始优化整个文件
nmap <silent> <leader>js :call g:Jsbeautify()<cr>
" }}}

" {{{ asins/renamer.vim 文件重命名
Bundle 'asins/renamer.vim'
" :Renamer 将当前文件所在文件夹下的内容显示在一个新窗口
" :Ren 开始重命名
"}}}

"{{{ 对齐代码
Bundle 'Eivy/Align'
" 原有,tt冲突
map <Leader>tT <Plug>AM_tt
" }}}

" 在工程中查找
" :Grep	按照指定的规则在指定的文件中查找
" :Rgrep	同上, 但是是递归的grep
" :GrepBuffer	在所有打开的缓冲区中查找
" :Bgrep	同上
" :GrepArgs	在vim的argument filenames (:args)中查找
" :Fgrep	运行fgrep
" :Rfgrep	运行递归的fgrep
" :Egrep	运行egrep
" :Regrep	运行递归的egrep
" :Agrep	运行agrep
" :Ragrep	运行递归的agrep
Bundle 'grep.vim'
nnoremap <silent> <C-f> :Grep<CR>

" {{{ asins/template.vim 文件模板
Bundle 'asins/template.vim'
let g:template_author = "Asins"
" }}}

" 快速文件查找器
" wget http://s3.wincent.com/command-t/releases/command-t-1.4.vba
" mkdir ~/.vim/bundle/command-t
" vim command-t-1.4.vba
" 执行:UseVimball ~/.vim/bundle/command-t
" 进入ruby目录下编译C扩展
" cd ~/.vim/bundle/command-t/ruby/command-t
" ruby extconf.rb
" make
" 无法直接使用Bundle安装，但是可以将文件下载到本地上传到~/.vim/bundle/command-t.忽略BundleInstall错误即可
Bundle 'command-t'
nnoremap <silent> <C-t> :CommandT<CR>
"nnoremap <silent> <C-S-t> :CommandTBuffer<CR>

"{{{ tpope/vim-fugitive Git命令集合
Bundle 'tpope/vim-fugitive'
if executable('git')
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
endif
"}}}

" 自动补全autocomplpop
Bundle 'AutoComplPop'
" 如果想 php 在 "$", "->", "::" 后出现自动补全，加入以下代码
if !exists('g:AutoComplPop_Behavior')
    let g:AutoComplPop_Behavior = {}
    let g:AutoComplPop_Behavior['php'] = []
    call add(g:AutoComplPop_Behavior['php'], {
            \   'command'   : "\<C-x>\<C-o>", 
            \   'pattern'   : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
            \   'repeat'    : 0,
            \})
endif

" taglist要配合ctags一起使用
" wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
" tar xvfz ctags-5.8.tar.gz && cd ctags-5.8
" ./configure
" make &&　make install
" www.vim.org/script.php?script_id=273
" Bundle "taglist/taglist_46.zip"
" 无法直接使用Bundle安装，但是可以将文件下载到本地上传到~/.vim/bundle/taglist中.忽略BundleInstall错误即可
Bundle 'taglist.vim'
let Tlist_Use_Right_Window = 1
nnoremap <silent> <F3> :TlistToggle<CR>
" 生成一个tags文件
nmap <F4> <Esc>:!ctags -R *<CR> 

" Alt-W切换自动换行
noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>

" 复制选中文本到系统剪贴板
vnoremap <leader>yo "*y
" 从系统剪贴板粘贴内容
nnoremap <leader>po "*p
" 选中模式 Ctrl+c 复制选中的文本
vnoremap <c-c> "+y
" 普通模式下 Ctrl+c 复制文件路径
nnoremap <c-c> :let @+ = expand('%:p')<cr>

" 删除所有行未尾空格
nnoremap <silent> <f12> :%s/[ \t\r]\+$//g<cr>

" VimFiles {{{
autocmd Filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
" }}}
" Arch Linux {{{
autocmd BufNewFile,BufRead PKGBUILD setlocal syntax=sh ft=sh
autocmd BufNewFile,BufRead *.install setlocal syntax=sh ft=sh
" }}}
" HTML {{{
autocmd FileType html,xhtml setlocal smartindent foldmethod=indent
" }}}
" CSS {{{
autocmd FileType css setlocal smartindent foldmethod=indent
autocmd FileType css setlocal noexpandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.scss setlocal ft=scss
" 删除一条CSS中无用空格
autocmd filetype css vnoremap <leader>co J:s/\s*\([{:;,]\)\s*/\1/g<CR>:let @/=''<cr>
autocmd filetype css nnoremap <leader>co :s/\s*\([{:;,]\)\s*/\1/g<CR>:let @/=''<cr>
" }}}
" Javascript {{{
autocmd BufRead,BufNewFile jquery.*.js setlocal ft=javascript syntax=jquery
autocmd BufRead,BufNewFile *.tpl setlocal ft=tpl syntax=html
" JSON syntax
autocmd BufRead,BufNewFile *.json setlocal ft=json
" }}}
" Markdown {{{
autocmd FileType markdown setlocal shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.mk setlocal filetype=markdown
" }}}

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

" 检测文件类型插件
filetype plugin indent on
" 设定配色"
colorscheme wombat256
