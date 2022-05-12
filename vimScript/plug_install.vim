" 插件安装
call plug#begin('~/.config/nvim/plugged')
	" VIM 主题
	Plug 'sainnhe/sonokai' " 主题
	Plug 'connorholyday/vim-snazzy' " 主题
	Plug 'junegunn/seoul256.vim'    " 主题

	"" VIM 底部栏目
	Plug 'itchyny/lightline.vim'

	"" 图标扩展
	Plug 'kyazdani42/nvim-web-devicons'
	
	" tree
	Plug 'preservim/nerdtree' " base
	Plug 'ryanoasis/vim-devicons' " icons
	Plug 'Xuyuanp/nerdtree-git-plugin' " git
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "美化NERDTree

	" 模糊搜索
	Plug 'Yggdroot/LeaderF', {'do': './install.sh'}

	" 快速注释
	Plug 'preservim/nerdcommenter'

	" 错误统计
	Plug 'dense-analysis/ale'

    " 函数列表
    Plug 'preservim/tagbar'
    
    " 历史树
    Plug 'mbbill/undotree'
    
    " 缩进视觉强化
    Plug 'nathanaelkane/vim-indent-guides'
    
    " 给行增加标签
    Plug 'kshenoy/vim-signature'
    
    " 快速选择
    Plug 'gcmt/wildfire.vim'
    
    " table
    Plug 'dhruvasagar/vim-table-mode'

	" 语法高亮
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'simrat39/symbols-outline.nvim'
	Plug 'voldikss/vim-floaterm' " 浮窗

	" lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'L3MON4D3/LuaSnip'
	
	" luanch
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" gdb
	
	" git
	Plug 'f-person/git-blame.nvim'

	" quick jump

	" run code
	Plug 'is0n/jaq-nvim'
	Plug 'sbdchd/neoformat'

	" wildmenu
	if has('nvim')
		function! UpdateRemotePlugins(...)
		" Needed to refresh runtime files
		let &rtp=&rtp
		UpdateRemotePlugins
		endfunction
		Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
	else
	" To use Python remote plugin features in Vim, can be skipped
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	endif

	" git-gui
	Plug 'kdheepak/lazygit.nvim'
	" coc.nvim
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}



call plug#end()
