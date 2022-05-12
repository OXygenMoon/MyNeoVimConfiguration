" KEY INIT
"
map S :w<CR>
map s <nop>

map Q :q<CR>
map R :source ~/.config/nvim/init.vim<CR>

"" Open the vimrc file anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

"" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

"" Compile Code
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitright
		:sp
		:term python3
	elseif &filetype == 'html'
		exec "!chromium % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	endif
endfunc

" 上下翻页
noremap U 5k
noremap E 5j


" 移动光标
noremap <C-a> $
noremap <C-i> 0

" 分屏
" 产生分屏 s + ijkl
" 移动光标 空格+ijkl
" i上 j左 k下 l右
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

" 切换现有分屏的排列方式
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map <LEADER>j <C-w>h
map <LEADER>k <C-w>j
map <LEADER>i <C-w>k
map <LEADER>l <C-w>l

map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize-5<CR>
map <LEADER><right> :vertical resize+5<CR>

" 搜索相关 = - 跳转上下; 空格 回车 取消搜索的高亮
noremap = nzz
noremap - Nzz
noremap <leader><cr> :nohlsearch<cr>

" 标签页
map tu :tabe<CR>
map t= :+tabnext<CR>
map t- :-tabnext<CR>

" 代码格式化
" nnoremap <silent> <Leader>f :Files<CR>

" 保存格式化
