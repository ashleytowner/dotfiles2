require('refactoring').setup({})

vim.keymap.set('v', '<leader>rf', function()
	require('refactoring').select_refactor()
end, { noremap = true, silent = true, expr = true })

vim.keymap.set('n', '<leader>rp', function()
	require('refactoring').debug.printf({ below = true })
end, { noremap = true, desc = 'Add a printf statement below current line' })

vim.keymap.set('n', '<leader>rP', function()
	require('refactoring').debug.printf({ below = false })
end, { noremap = true, desc = 'Add a printf statement above current line' })
