" 一些函数

" 跨会话撤销
set nobackup "编辑时不保留上一个备份文件
    if has('persistent_undo')
        set undofile
        set undodir=~/.vim/undodir "可以撤销回到保存之前的编辑
        if !isdirectory(&undodir)
            call mkdir(&undodir, 'p', 0700)
        endif
    endif

" 鼠标操作
if has('mouse')
    if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
	set mouse=a
    else
	set mouse=nvi
    endif
endif

" gui字体
if has('gui_running')
    set guifont=courier\ new:h10
endif
