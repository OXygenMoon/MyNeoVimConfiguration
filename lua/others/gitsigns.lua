local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  vim.notify("gitsigns not found!")
  return
end


vim.api.nvim_exec("highlight GitAdd guifg=#008B00", false)
vim.api.nvim_exec("highlight GitChange guifg=#1874CD", false)
vim.api.nvim_exec("highlight GitDelete guifg=#CD5555", false)

gitsigns.setup {
  signs = {
    -- add          = {hl = 'GitSignsAdd'   , text = '', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    -- change       = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    -- delete       = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    -- topdelete    = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    -- changedelete = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    add          = {hl = 'GitAdd', text = '▌', numhl='GitAdd'   , linehl='GitAdd'},
    change       = {hl = 'GitChange', text = '▌', numhl='GitChange', linehl='GitChange'},
    delete       = {hl = 'GitDelete', text = '▌', numhl='GitDelete', linehl='GitDelete'},
    topdelete    = {hl = 'GitDelete', text = '▌', numhl='GitDelete', linehl='GitDelete'},
    changedelete = {hl = 'GitChange', text = '▌', numhl='GitChange', linehl='GitChange'},
  },


  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000, follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single', -- double, rounded, solid, shadow,
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  trouble = true, 
  yadm = {
    enable = false
  },


  -- keymapping
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', '<leader>]', ':Gitsigns next_hunk<CR>')
    map('n', '<leader>[', ':Gitsigns prev_hunk<CR>')

    -- Actions 
    -- map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    -- map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    -- map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    -- map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    -- map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', 'K', '<cmd>Gitsigns preview_hunk<CR>')
    -- map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    -- map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    -- map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    -- map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    -- map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')
    --
    -- Text object
    -- map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    -- map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
