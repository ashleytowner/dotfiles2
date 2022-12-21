require('hop').setup()

vim.keymap.set(
	'n',
	'<leader>w',
	function() require('hop').hint_words({ multi_windows = true }) end,
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>f',
	function() require('hop').hint_char1() end,
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>s',
	function() require('hop').hint_char2() end,
	{ noremap = true }
)
vim.keymap.set(
	'n',
	'<leader>h',
	function() require('hop').hint_anywhere() end,
	{ noremap = true }
)
