set termguicolors
set timeoutlen=500

runtime ./vimScript/vimrc.vim

" runtime ./vimScript/maps.vim

runtime ./vimScript/functions.vim



call plug#begin('~/.config/nvim/plugged')
" startuptime
Plug 'rhysd/vim-startuptime'

" Winshift
Plug 'sindrets/winshift.nvim'

" Theme
Plug 'projekt0n/github-nvim-theme' " github_* 主题
Plug 'bluz71/vim-nightfly-guicolors' " Night Owl / moonfly
Plug 'sainnhe/edge' " edge dark
Plug 'ellisonleao/gruvbox.nvim' " gruvbox
Plug 'AlessandroYorba/Alduin' " alduin 优雅
Plug 'sainnhe/everforest'
Plug 'glepnir/oceanic-material'
Plug 'sonph/onehalf'
Plug 'joshdick/onedark.vim' " onedark
Plug 'marko-cerovac/material.nvim'

" notify
Plug 'rcarriga/nvim-notify'

" 替换
Plug 'brooth/far.vim'

Plug 'kyazdani42/nvim-web-devicons' " 图标扩展
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" lualine - packer
Plug 'akinsho/bufferline.nvim'

" coding-base
Plug 'preservim/nerdcommenter' " 备注
Plug 'dense-analysis/ale' " 语法纠错

" tree
Plug 'kyazdani42/nvim-tree.lua'

" 缩进视觉强化
Plug 'lukas-reineke/indent-blankline.nvim'


" 快速选择
Plug 'gcmt/wildfire.vim'

" table
" Plug 'dhruvasagar/vim-table-mode' " TODO:

" tagbar
Plug 'simrat39/symbols-outline.nvim' " TODO: 还不会配置

" 浮窗
Plug 'voldikss/vim-floaterm' " 终端浮窗
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'kdheepak/lazygit.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' " TODO: 可以进一步配置
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" 按键绑定
" Plug 'liuchengxu/vim-which-key'
" Plug 'AckslD/nvim-whichkey-setup.lua'
" Plug 'folke/which-key.nvim'

" 界面
Plug 'goolord/alpha-nvim'
Plug 'p-z-l/aleph-nvim'

" Git
Plug 'lewis6991/gitsigns.nvim' " 显示git修正, hunk预览
Plug 'sindrets/diffview.nvim' " 显示git diff
Plug 'TimUntersberger/neogit' " 显示git log相关信息

" nvim-dap TODO:

" lsp
Plug 'williamboman/nvim-lsp-installer'
Plug 'prabirshrestha/vim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'f3fora/cmp-spell'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-copilot'
Plug 'ray-x/cmp-treesitter'
Plug 'kosayoda/nvim-lightbulb'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'ray-x/cmp-treesitter'
Plug 'stevearc/aerial.nvim'


" Snip
Plug 'L3MON4D3/LuaSnip' " TODO:
Plug 'rafamadriz/friendly-snippets' " 代码段合集 TODO:

" python format
Plug 'Chiel92/vim-autoformat'

" " coc.nvim
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" dash
"Plug 'mrjones2014/dash.nvim', { 'do': 'make install' }

" surround
Plug 'tpope/vim-surround'  " cs<c><c> ds<c>

" 函数说明
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" 快速跳
Plug 'easymotion/vim-easymotion'

" 启动加速
Plug 'lewis6991/impatient.nvim'

" " debugger
Plug 'ravenxrz/DAPInstall.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-telescope/telescope-dap.nvim'


" ToDo(hl todo, bug, warn, hack, prep, note)
Plug 'folke/todo-comments.nvim'
Plug 'folke/trouble.nvim'

" " 实时颜色
Plug 'norcalli/nvim-colorizer.lua'

" Litee 调用树
Plug 'ldelossa/litee.nvim'
Plug 'ldelossa/litee-calltree.nvim'

" hslens 
Plug 'kevinhwang91/nvim-hlslens'

Plug 'ethanholz/nvim-lastplace'


call plug#end()


colorscheme material



lua require("init")