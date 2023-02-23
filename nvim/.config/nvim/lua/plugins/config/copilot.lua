vim.g.copilot_no_tab_map = true

vim.keymap.set(
	'i',
	'<C-g>n',
	'<Plug>(copilot-next)',
	{ noremap = true }
)

vim.keymap.set(
	'i',
	'<C-g>p',
	'<Plug>(copilot-prev)',
	{ noremap = true }
)

vim.keymap.set(
	'i',
	'<Plug>(vimrc:copilot-dummy-map)',
	'copilot#Accept("")',
	{
		noremap = true,
		silent = true,
		expr = true,
		script = true,
		desc = "Copilot dummy map"
	}
)
