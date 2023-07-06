require('mason-nvim-dap').setup({
	ensure_installed = { 'node2' },
	handlers = {
		function(config)
			require('mason-nvim-dap').default_setup(config)
		end
	}
})

vim.keymap.set('n', 'gdc', function()
	require('dap').continue()
end)

-- navigation
vim.keymap.set('n', 'gdb', function() require("dap").toggle_breakpoint() end)
vim.keymap.set('n', 'gdn', function() require("dap").step_over() end)
vim.keymap.set('n', 'gd]', function() require("dap").step_into() end)
vim.keymap.set('n', 'gd[', function() require("dap").step_out() end)
vim.keymap.set('n', 'gdq', function()
	require('dap').close()
end)

-- widgets & repl
vim.keymap.set('n', 'gdt', function() require("dap").repl.open() end)

vim.keymap.set('n', 'gds', function()
	local widgets = require('dap.ui.widgets')
	widgets.sidebar(widgets.scopes).open()
end)

vim.keymap.set({'n', 'v'}, 'gdK', function()
	local widgets = require('dap.ui.widgets')
	widgets.hover(widgets.expression).open()
end)
