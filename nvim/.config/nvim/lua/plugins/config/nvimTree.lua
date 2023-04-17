require('nvim-tree').setup({
	git = {
		ignore = false
	},
	diagnostics = {
		enable = true
	},
	view = {
		side = "right"
	},
	renderer = {
		highlight_git = true,
		icons = {
			git_placement = "after",
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = true
			},
			glyphs = {
				git = {
					unstaged = "!",
					staged = "+",
					unmerged = "",
					renamed = "➜",
					untracked = "?",
					deleted = "",
					ignored = "◌",
				}
			}
		}
	}
})

vim.keymap.set(
	'n',
	'<leader><leader>',
	'<cmd>NvimTreeFindFileToggle<cr>',
	{ noremap = true, desc = "open nvim tree" }
);
