local opts = { noremap = true, silent = true }
local opts_nosilent = { noremap = true }
local no_opts = { noremap = false, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",


-- 移动分屏
keymap("n", "<leader>j", "<C-w>h", opts)
keymap("n", "<leader>k", "<C-w>j", opts)
keymap("n", "<leader>i", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)
-- NOTE: require winshit plugin
keymap("n", "<leader>m", ":WinShift<cr>", opts)

-- 快速切换分屏
keymap("n", "sl", ":set splitright<CR>:vsplit<CR>", opts)
keymap("n", "sj", ":set nosplitright<CR>:vsplit<CR>", opts)
keymap("n", "si", ":set nosplitbelow<CR>:split<CR>", opts)
keymap("n", "sk", ":set splitbelow<CR>:split<CR>", opts)

-- 切换分屏方式 有了winshift这里可以不需要了
-- keymap("n", "sv", "<C-w>t<C-w>H", opts)
-- keymap("n", "sh", "<C-w>t<C-w>K", opts)

-- 窗口大小变化
keymap("n", "<leader><up>", ":res +5<CR>", opts)
keymap("n", "<leader><down>", ":res -5<CR>", opts)
keymap("n", "<leader><left>", ":vertical resize-5<CR>", opts)
keymap("n", "<leader><right>", ":vertical resize+5<CR>", opts)


-- 基础
keymap("n", "S", ":w<CR>", opts)
keymap("n", "s", "<nop>", opts)
keymap("n", "Q", ":q<CR>", opts)
keymap("n", "R", ":source ~/.config/nvim/init.vim<CR>", opts)
keymap("n", "<leader>rc", ":e ~/.config/nvim/init.vim<CR>", opts)

-- 运行命令
keymap("n", "r", ":call CompileRunGcc()<CR>", opts)
vim.cmd [[
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ -std=c++11 % -o %<"
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
]]

-- 翻页
keymap("n", "U", "5k", opts)
keymap("n", "E", "5j", opts)
keymap("v", "U", "5k", opts)
keymap("v", "E", "5j", opts)
keymap("n", "<C-u>", "15k", opts)
keymap("n", "<C-e>", "15j", opts)

-- 快速插入或移动光标
keymap("n", "A", "$a", opts)
keymap("n", "I", "^i", opts)

-- 搜索
keymap("n", "=", "nzz", no_opts)
keymap("n", "-", "Nzz", no_opts)
keymap("n", "<leader><CR>", ":nohlsearch<CR>", no_opts)

-- 标签页
keymap("n", "tu", ":tabe<CR>", opts)
keymap("n", "t=", ":+tabnext<CR>", opts)
keymap("n", "t-", ":-tabnext<CR>", opts)
keymap("n", "<leader>r", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader>e", ":BufferLineCyclePrev<CR>", opts)

-- 移动文本
keymap("n", "<leader>i", "<Esc>:m .+1<CR>", opts)
keymap("n", "<leader>k", "<Esc>:m .-2<CR>", opts)

-- visual -- 
-- 控制缩进
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- 插件
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<F3>", "<cmd>AerialToggle<CR>", opts)

-- telescope
-- bookmark's
keymap("n", "ma", "<cmd>Telescope vim_bookmarks current_file<cr>", opts)
keymap("n", "mA", "<cmd>Telescope vim_bookmarks all<cr>", opts)

-- calltree
keymap("n", "<leader>in", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", opts)

-- debug
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<leader>dl", "lua require'dap'.run_last()<cr>", opts)
keymap('n', '<F10>', '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)



vim.cmd [[
        inoremap 。 .
        inoremap ， ,
        inoremap ？ ?
        inoremap ； ;
        inoremap ： :
        inoremap ！ !
        inoremap ‘ ''<ESC>i
        inoremap ’ ''<ESC>i
        inoremap “ ""<ESC>i
        inoremap ” ""<ESC>i
        inoremap （ ()<ESC>i
        inoremap ） ()<ESC>i
        inoremap 【 []<ESC>i
        inoremap 】 []<ESC>i
]]
