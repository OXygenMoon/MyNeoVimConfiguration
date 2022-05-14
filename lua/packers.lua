return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

	-- lualine
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

end)
