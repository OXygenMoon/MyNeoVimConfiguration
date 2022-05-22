map R :source ~/.config/nvim/vscode/init.vim<CR>
let mapleader=" "
set cursorline "下横线

" === vim plug ===
if empty(glob('~/.local/share/nvim/site/autoload'))
silent !curl -fLo ~/.local/share/nvim/site/autoload --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
augroup PlugInstall
   autocmd VimEnter * PlugInstall | source '~/.config/nvim/vscode/init.vim'
augroup END 
endif

call plug#begin('~/.config/nvim/vscode/plugged')
   Plug 'marko-cerovac/material.nvim'
Plug 'phaazon/hop.nvim'

call plug#end()