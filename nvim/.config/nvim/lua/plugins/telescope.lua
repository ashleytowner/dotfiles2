require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    dynamic_preview_title = true,
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {
        shorten = 2
    },
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  pickers = {
      find_files = {
          theme = "ivy"
      },
      git_branches = {
          theme = "ivy"
      },
      buffers = {
          theme = "ivy"
      },
      live_grep = {
          theme = "ivy"
      }
  }
}

-- Telescope
nnoremap('<C-f>', '<cmd>Telescope live_grep<cr>')
if (vim.g.uname == "Linux\n") then
		nnoremap('<C-p>', '<cmd>Telescope find_files find_command=fdfind,--hidden,--type,f<cr>')
else
		nnoremap('<C-p>', '<cmd>Telescope find_files find_command=fd,--hidden,--type,f<cr>')
end
nnoremap('<leader>gco', '<cmd>Telescope git_branches<cr>')
nnoremap('<leader>ls', '<cmd>Telescope buffers<cr>')
