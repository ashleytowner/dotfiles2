local telescope = require('telescope')
telescope.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden'
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
    path_display = { "truncate" },
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  extensions = {
    'lsp_handlers',
    'refactoring',
    ['ui-select'] = {
      require('telescope.themes').get_cursor()
    }
  },
  pickers = {
      find_files = {
          theme = "dropdown"
      },
      git_branches = {
          theme = "dropdown"
      },
      buffers = {
          theme = "dropdown"
      },
      live_grep = {
          theme = "dropdown"
      },
      lsp_code_actions = {
        theme = "cursor"
      },
      lsp_references = {
        theme = "cursor"
      },
      lsp_definitions = {
        theme = "cursor"
      },
      quickfix = {
        theme = "ivy"
      },
      loclist = {
        theme = "ivy"
      }
  }
}

telescope.load_extension('ui-select');
telescope.load_extension('refactoring');

-- Telescope
Nnoremap('<C-f>', '<cmd>Telescope live_grep<cr>')
if (vim.g.uname == "Linux\n") then
  Nnoremap('<C-p>', '<cmd>Telescope find_files find_command=fdfind,--hidden,--type,f previewer=false<cr>')
else
  Nnoremap('<C-p>', '<cmd>Telescope find_files find_command=fd,--hidden,--type,f previewer=false<cr>')
end
Nnoremap('<leader>gco', '<cmd>Telescope git_branches<cr>')
Nnoremap('<leader>ls', '<cmd>Telescope buffers<cr>')
Vnoremap('<leader>rr', '<esc><cmd>lua require(\'telescope\').extensions.refactoring.refactors()<CR>')
