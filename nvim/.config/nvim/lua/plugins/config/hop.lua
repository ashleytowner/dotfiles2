require('hop').setup({
	reverse_distribution = true,
	multi_windows = true,
	keys = 'asdfghjkl;qwertyuiop'
})

vim.keymap.set(
	'n',
	'<leader>w',
	function() require('hop').hint_words() end,
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
	'<leader>F',
	function() require('hop').hint_anywhere() end,
	{ noremap = true }
)
