---Create keymaps for a text object defined as anything between
---two instances of char
---@param char string
local function setBetweenObject(char)
	vim.keymap.set(
		{ 'o', 'x' },
		'a' .. char,
		':<C-u>silent! normal! f'..char..'F'..char..'vf'..char..'<cr>',
		{ silent = true, noremap = true }
	)

	vim.keymap.set(
		{ 'o', 'x' },
		'i' .. char,
		':<C-u>silent! normal! f'..char..'F'..char..'lvt'..char..'<cr>',
		{ silent = true, noremap = true }
	)
end

setBetweenObject('*')
setBetweenObject('/')
setBetweenObject('.')
setBetweenObject('_')
setBetweenObject('|')
setBetweenObject('$')
setBetweenObject('#')
