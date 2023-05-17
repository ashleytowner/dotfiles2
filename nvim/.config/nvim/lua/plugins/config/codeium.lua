vim.g.codeium_disable_bindings = true
vim.g.ai = 'codeium'

vim.keymap.set(
	'i',
	'<C-g>n',
	'<CMD>call codeium#CycleCompletions(1)<CR>',
	{ noremap = true }
)

vim.keymap.set(
	'i',
	'<C-g>p',
	'<CMD>call codeium#CycleCompletions(-1)<CR>',
	{ noremap = true }
)

vim.keymap.set(
	'i',
	'<C-g><CR>',
	'<CMD>call codeium#Accept()<CR>',
	{ noremap = true }
)

vim.keymap.set(
	'i',
	'<C-g><C-e>',
	'<CMD>call codeium#Clear()<CR>',
	{ noremap = true }
)

