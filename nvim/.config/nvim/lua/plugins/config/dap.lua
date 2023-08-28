-- setup
require('mason-nvim-dap').setup({
	ensure_installed = { 'node2' },
	handlers = {
		function(config)
			require('mason-nvim-dap').default_setup(config)
		end,
	},
})

require('nvim-dap-virtual-text').setup()
require('dapui').setup()

-- keymappings

vim.keymap.set('n', '<F4>', function()
	require('dap').continue()
end)

vim.keymap.set('n', '<leader>b', function()
	require('dap').toggle_breakpoint()
end)

-- listeners
require('dap').listeners.after.event_initialized['dapui'] = function()
	require('dapui').open()
end

require('dap').listeners.before.event_terminated['dapui'] = function()
	require('dapui').close()
end

require('dap').listeners.before.event_exited['dapui'] = function()
	require('dapui').close()
end

require('dap').listeners.after.event_initialized['keymaps'] = function()
	vim.o.mouse='nv'
	vim.keymap.set('n', '<F3>', function()
		require('dap').step_over()
	end)
	vim.keymap.set('n', '<F2>', function()
		require('dap').step_into()
	end)
	vim.keymap.set('n', '<F12>', function()
		require('dap').step_out()
	end)
	vim.keymap.set('n', '<C-c>', function()
		require('dap').terminate()
	end)
end

require('dap').listeners.before.event_terminated['keymaps'] = function()
	vim.o.mouse=''
end

require('dap').listeners.before.event_exited['keymaps'] = function()
	vim.o.mouse=''
end



