" Configuration file for vim
set modelines=0              " CVE-2007-2438
set shortmess=atl

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements

"********************************基本设置******************************"
syntax on                    " 打开语法高亮
syntax enable                " 打开语法高亮
set completeopt=preview,menu
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

set autochdir                " 设定文件浏览器目录为当前目录
set autoread                 " 当文件在外部被修改，自动更新该文件
set autowrite                " 自动检测并加载外部对文件的修改
set noswapfile               " 设置无交换区文件"
set writebackup              " 设置无备份文件
set nobackup                 " 设置无备份文件

filetype on
filetype plugin on
filetype indent on
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936,utf-16,big5,euc-jp,euc-kr,latin1
set nocompatible             " Use Vim defaults instead of 100% vi compatibility
set langmenu=zh_CN.UTF-8
set helplang=cn

set mouse=a                  " 启用鼠标
set selection=exclusive
set selectmode=mouse,key

set hlsearch
set incsearch
set ignorecase
set noerrorbells
set novisualbell
"set paste
set smartcase
set confirm
set wrap

set laststatus=2             " 开启状态栏信息
set wildmenu
set showcmd                  " 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来
set cmdheight=2              " 命令行的高度，默认为1，这里设为2

set backspace=indent,eol,start              " 设置退格键可用

set scrolloff=5 
set formatoptions=tcrqn
set viminfo='20,\"50
set history=50

set number                   " 在每一行最前面显示行号
set ruler                    " 在编辑过程中，在右下角显示光标位置的状态行
set cursorline               " 突出显示当前行
set showmatch                " 高亮显示对应的括号

set smarttab
set expandtab                "空格替换制表符
set softtabstop=2
set tabstop=2                " 设置tab键的宽度

set shiftwidth=2             " 缩进使用2个空格
set autoindent               " 自动对齐
set cindent
set smartindent              " 智能自动缩进

set foldcolumn=0
set foldmethod=syntax        " 选择代码折叠类型
set foldopen=all
set ambiwidth=double

set is
"********************************基本设置******************************"
autocmd BufNewFile *.[ch]pp,*.[ch],*.sh,*.java exec ":call InsertTemplate()"
:function! InsertTemplate()
  let suffix=expand("%:e")
  let name=expand("%:r")
  
  if suffix=='sh'
    call setline("1","\#!/bin/bash")
  elseif suffix=='cpp'||suffix=='c'
    call setline("1","\#include \"stdafx.h\"")
    call append(line("."),"")
    call append(line(".")+1,"\#include \"".name.".h\"")
  elseif suffix=='hpp'||suffix=='h'
    call setline("1","\#pragma once")
    call append(line("."),"")
    call append(line(".")+1,"\#ifndef __".toupper(name)."_".toupper(suffix)."__")
    call append(line(".")+2,"\# define __".toupper(name)."_".toupper(suffix)."__")
    call append(line(".")+3,"")
    call append(line(".")+4,"\#endif // !__".toupper(name)."_".toupper(suffix)."__")
    normal 5G
  endif
:endfunction
"********************************基本设置******************************"

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1
