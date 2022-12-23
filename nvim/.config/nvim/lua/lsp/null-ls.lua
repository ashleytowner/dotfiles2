local mason_null_ls = require('mason-null-ls')
local null_ls = require('null-ls')

mason_null_ls.setup({
	automatic_setup = true,
	ensure_installed = {
		'stylelint',
		'eslint_d',
		'jq',
	}
})



mason_null_ls.setup_handlers({
	function(source, methods)
		require('mason-null-ls.automatic_setup')(source, methods)
	end
})

null_ls.setup()
