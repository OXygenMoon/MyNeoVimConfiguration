-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("lualine not found!")
  return
end

local ok, gps = pcall(require, "nvim-gps")
if not ok then
  vim.notify("nvim-gps not found!")
  return
end


local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
  lightGold = '#FFEC8B',
  paleGreen = '#7CCD7C',
  sandyBrown = '#F4A460',
  purple = '#9370DB',
  grey_2 = '#1C1C1C',
  
  -- dark color
  -- blue   = '#00688B',
  -- green  = '#006400',
  -- orange = '#8B4500',
  -- pink = '#8B3A62',
  -- light color
  blue   = '#FFF68F',
  green  = '#C1FFC1',
  orange = '#FFDEAD',
  pink   = '#FFF0F5',
}

local oxygen_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.grey},
    c = { fg = colors.white, bg = colors.grey_2},
    x = { fg = colors.white, bg = colors.black},
  },

  insert = { a = { fg = colors.black, bg = colors.green} },
  visual = { a = { fg = colors.black, bg = colors.orange} },
  command = { a = { fg = colors.black, bg = colors.pink} },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.grey_2 },
    b = { bg = colors.black, bg = colors.grey_2},
    c = { fg = colors.black, bg = colors.grey_2 },
  },
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- local block

local mode = {
'mode', 
      -- separator = '',
       separator = { left = ''}, 
      right_padding = 2,
}

local diagnostics = {
'diagnostics',
			sources = {'nvim_diagnostic'}, -- ale
			sections = {'error', 'warn', 'info'}, -- 'hint'
			      diagnostics_color = {
        error = 'DiagnosticError', -- Changes diagnostics' error color.
        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
        -- hint  = 'DiagnosticHint',  -- Changes  diagnostics' hint color.
      },
	        symbols = {error = ' ', warn = ' ', info = ' '},
      colored = true,           -- Displays diagnostics status in color if set to true.
      update_in_insert = false, -- Update diagnostics in insert mode.
      always_visible = true,   -- Show diagnostics even if there are none.
}

local diff = {
'diff',
      colored = true,
			symbols = { added = ' ', modified = ' ', removed = ' ' },
			diff_color = {
			   added = { fg = '#00CD66' },
			   modified = { fg = '#00B2EE' },
			   removed = { fg = '#FF6347' },
			 },
      color = {fg = colors.black, bg = colors.grey},
			 cond = conditions.hide_in_width,
}

local branch = {
'branch',
        icons_enabled = true,
        icon = '',
        color = { fg = colors.white, bg = '#5D478B'},
        separator = { right = ''},
        left_padding = 2,
}

local filename = {
'filename', 
      path = 1,
      shorting_target = 40,
      cond = conditions.buffer_not_empty,
			padding = {left = 1, right = 1},
      separator = {right = '|'}, 
			color = {fg = colors.white},
      separator = { right = '', color = colors.grey},
}

local filetype = {
"filetype",
  icons_enabled = true,
}
-- end local block








local config = {
  options = {
    icons_enabled = true,
    theme = oxygen_theme,
    --theme = "vscode",
    -- component_separators = { left = "", right = "" },
    component_separators = "",
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      "alpha",
      "dashboard",
      "NvimTree",
      "Outline",
      "CHADTree"
    },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { 
                    diagnostics,
                    filename, 
                    {
                          gps.get_location,
                          -- cond = gps.is_available,
                          always_visible = true,
                          separator = {left = "", right = ''},
                    },
  },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {"copilot", diff, branch},
  },
  inactive_sections = {
    lualine_a = {filename},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'},
  },
  tabline = {},
  extensions = {},
}

return lualine.setup(config)




-- aerial
-- chadtree
-- fern
-- fugitive
-- fzf
-- nerdtree
-- neo-tree
-- nvim-tree
-- quickfix
-- symbols-outline
-- toggleterm

