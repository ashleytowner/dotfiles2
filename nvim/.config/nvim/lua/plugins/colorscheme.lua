require('catppuccin').setup({
	background = {
		light = "latte",
		dark = "macchiato"
	},
	show_end_of_buffer = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		hop = true,
		mason = true,
		nvimtree = true,
		telescope = {
			enabled = true,
			style = 'nvchad'
		}
	}
})

vim.cmd([[colorscheme catppuccin]])
