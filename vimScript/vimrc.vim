" NORMAL INIT

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on


" set guifont="Anonymice Nerd Font"
set nocompatible "在较老的vim版本上需要
set encoding=utf8
let mapleader=" "
set fileencodings=ucs-bom,utf-8,gb18030,latin1
let &t_ut='' "有些配色出现问题可以使用这个
syntax on "高亮语法
set number "显示行号
" set relativenumber "相对行号
set cursorline "下横线
" set wrap "字不会超出一行
set showcmd "右下角显示输入的命令
set wildmenu "普通模式下命令的tab选择补全
set hlsearch "高亮搜索
set incsearch "边搜边高亮
exec "nohlsearch"
set ignorecase "忽略搜索大小写
set smartcase "智能大小写搜索
" tab键
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=0
set tw=0
set indentexpr=
" 显示行尾空格
set list
"set listchars=tab:""\,trail:"
set nolist
" 回退
set backspace=indent,eol,start
" 收代码
set foldmethod=indent
set foldlevel=99
" 不同模式不同的光标
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"
set laststatus=2 "
set autochdir "vim在当前目录下执行
" 让光标停留在上一次关闭文件的位置
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
