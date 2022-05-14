local ok, actions = pcall(require, "telescope.actions")
if not ok then
  vim.notify("telescope.actions not found!")
	return
end

local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("telescope not found!")
  return
end

local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end




telescope.setup {
    defaults = {
      buffer_previewer_maker = new_maker,
      path_display = {
        shorten = {
          len = 1,
          exclude = {1, -1},
        },
      },

      mappings = {
        i = {
          ["<Left>"] = actions.cycle_history_next, -- 历史搜索前移
          ["<Right>"] = actions.cycle_history_prev, -- 历史搜索后移

          ["<Down>"] = actions.move_selection_next, -- 搜索前移
          ["<Up>"] = actions.move_selection_previous, -- 搜索后移

          ["<C-c>"] = actions.close, -- 关闭

          ["<CR>"] = actions.select_default, -- 打开新的tab
          ["<C-h>"] = actions.select_horizontal, -- 打开后垂直分割
          ["<C-v>"] = actions.select_vertical, -- 打开后水平分割
          ["<C-t>"] = actions.select_tab, 

          ["<C-j>"] = actions.preview_scrolling_up, -- 预览滚动上
          ["<C-d>"] = actions.preview_scrolling_down, -- 预览滚动下

          ["<C-e>"] = actions.results_scrolling_up,  -- 结果滚动上
          ["<C-u>"] = actions.results_scrolling_down, -- 结果滚动下

          -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-l>"] = actions.complete_tag,
          ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        },

        n = {
          ["<esc>"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-h>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,

          ["<C-j>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<C-e>"] = actions.results_scrolling_up,
          ["<C-u>"] = actions.results_scrolling_down,

          ["?"] = actions.which_key,          
        },
      },

      pickers = {
        find_files = {
          -- theme = "dropdown",
          find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
        },
        live_grep = {
          --@usage don't include the filename in the search results
          only_sort_text = true,
        },
      },



      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.75,
        preview_cutoff = 120,
        horizontal = {
          preview_width = function(_, cols, _)
            if cols < 120 then
              return math.floor(cols * 0.5)
            end
            return math.floor(cols * 0.6)
          end,
          mirror = false,
        },
        vertical = { mirror = false},
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },

      file_ignore_patterns = {},
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,

    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }

-- telescope.load_extension('fzf')
-- telescope.load_extension("ui-select")
telescope.load_extension('dap')
telescope.load_extension('vim_bookmarks')