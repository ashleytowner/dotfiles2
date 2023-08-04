require('hop').setup({
	reverse_distribution = true,
	multi_windows = true,
	keys = 'asdfghjkl;qwertyuiop',
})

vim.keymap.set('n', '<leader>w', function()
	require('hop').hint_words()
end, { noremap = true })

vim.keymap.set('n', '<leader>f', function()
	require('hop').hint_char1()
end, { noremap = true })

vim.keymap.set('n', '<leader>s', function()
	require('hop').hint_char2({
		hint_position = require('hop.hint').HintPosition.END,
		hint_offset = -1,
	})
end, { noremap = true })
