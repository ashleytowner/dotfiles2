local telescopeOk, telescope = pcall(require, 'telescope')

if not telescopeOk then
	return
end

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--hidden',
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
		file_sorter = require 'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		dynamic_preview_title = true,
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
		use_less = true,
		path_display = { "truncate" },
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker
	},
	extensions = {
		'refactoring',
		['ui-select'] = {
			require('telescope.themes').get_cursor()
		}
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			find_command = {
				'rg',
				'--files',
				'--hidden',
				'--glob',
				'!.git/'
			}
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
		},
		diagnostics = {
			theme = "ivy"
		}
	}
});

-- Extensions
telescope.load_extension('ui-select');
telescope.load_extension('refactoring');

local builtin = require('telescope.builtin');

-- Keymaps
vim.keymap.set(
	'n',
	't/',
	builtin.live_grep,
	{ noremap = true }
);

vim.keymap.set(
	'n',
	'<C-p>',
	builtin.find_files,
	{ noremap = true }
);

vim.keymap.set(
	'n',
	'<C-M-p>',
	function() builtin.find_files({
			find_command = {
				'rg',
				'--hidden',
				'--files'
			}
		})
	end,
	{ noremap = true }
);

vim.keymap.set(
	'n',
	'<leader>tq',
	builtin.quickfix,
	{ noremap = true }
);

vim.keymap.set(
	'n',
	'<leader>tg',
	builtin.git_branches,
	{ noremap = true }
);

vim.keymap.set(
	'n',
	'<leader>tb',
	builtin.buffers,
	{ noremap = true }
);

vim.keymap.set(
	'v',
	'<leader>rr',
	require('telescope').extensions.refactoring.refactors,
	{ noremap = true }
);

vim.keymap.set(
	'n',
	'<leader>tp',
	builtin.resume,
	{ noremap = true }
);

vim.keymap.set(
	'n',
	'<leader>tc',
	builtin.colorscheme,
	{ noremap = true }
);

vim.keymap.set(
	'n',
	'<leader>ls',
	builtin.buffers,
	{ noremap = true }
);

