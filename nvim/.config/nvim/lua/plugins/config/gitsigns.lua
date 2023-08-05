local gs = require('gitsigns')
gs.setup({
	signs = {
		add = {
			hl = 'GitSignsAdd',
			text = '▎',
			numhl = 'GitSignsAddNr',
			linehl = 'GitSignsAddLn',
		},
		change = {
			hl = 'GitSignsChange',
			text = '▎',
			numhl = 'GitSignsChangeNr',
			linehl = 'GitSignsChangeLn',
		},
		delete = {
			hl = 'GitSignsDelete',
			text = '▁',
			numhl = 'GitSignsDeleteNr',
			linehl = 'GitSignsDeleteLn',
		},
		topdelete = {
			hl = 'GitSignsDelete',
			text = '▔',
			numhl = 'GitSignsDeleteNr',
			linehl = 'GitSignsDeleteLn',
		},
		changedelete = {
			hl = 'GitSignsChange',
			text = '▎',
			numhl = 'GitSignsChangeNr',
			linehl = 'GitSignsChangeLn',
		},
	},
	current_line_blame = false,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol',
		delay = 0,
	},
})

vim.keymap.set('n', 'gsh', gs.preview_hunk)
vim.keymap.set('n', 'gsb', function()
	gs.blame_line({ full = true })
end)
vim.keymap.set('n', 'gss', gs.stage_hunk)
vim.keymap.set('n', 'gsS', gs.undo_stage_hunk)
vim.keymap.set('n', ']h', gs.next_hunk)
vim.keymap.set('n', '[h', gs.prev_hunk)
