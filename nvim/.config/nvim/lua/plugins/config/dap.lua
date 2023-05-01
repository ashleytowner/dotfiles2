require('mason-nvim-dap').setup({
	ensure_installed = { 'node2' },
	handlers = {
		function(config)
			require('mason-nvim-dap').default_setup(config)
		end
	}
})

vim.keymap.set('n', '<leader>dc', '<cmd>lua require("dap").continue()<CR>')
vim.keymap.set('n', '<leader>dr', '<cmd>lua require("dap").repl.open()<CR>')
vim.keymap.set('n', '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>dn', '<cmd>lua require("dap").step_over()<CR>')
vim.keymap.set('n', '<leader>di', '<cmd>lua require("dap").step_into()<CR>')
vim.keymap.set('n', '<leader>do', '<cmd>lua require("dap").step_out()<CR>')
vim.keymap.set('n', '<leader>dstop', '<cmd>lua require("dap").stop()<CR>')
vim.keymap.set('n', '<leader>ds', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.scopes).open()
end)

