local mason_null_ls = require('mason-null-ls')
local null_ls = require('null-ls')

mason_null_ls.setup({
	ensure_installed = {
		'stylelint',
		'eslint_d',
		'jq',
	},
	handlers = {
		function(source, methods)
			require('mason-null-ls.automatic_setup')(source, methods)
		end,
		['eslint_d'] = function(source, methods)
			-- Check if an eslint config file exists before starting eslint
			if vim.fn.glob('.eslintrc*') ~= '' then
				require('mason-null-ls.automatic_setup')(source, methods)
			end
		end
	}
})

null_ls.setup()
