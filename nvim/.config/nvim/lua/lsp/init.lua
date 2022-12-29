local keymaps = require('lsp.keymaps')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require('mason-lspconfig').setup({
	ensure_installed = {
		'bashls',
		'clangd',
		'cssls',
		'html',
		'sumneko_lua',
		'pyright',
		'stylelint_lsp',
		'tsserver',
		'vimls',
		'yamlls',
	}
})

require('mason-lspconfig').setup_handlers {
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have
		-- a dedicated handler.
		function (server_name)
			require("lspconfig")[server_name].setup({
				on_attach = function()
					keymaps.set_keymaps()
				end
			})
		end
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
	 border = "single"
	}
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		-- Enable underline, use default values
		underline = true,
		-- Enable virtual text, override spacing to 4
		virtual_text = {
			 spacing = 1,
		},
		update_in_insert = false,
	}
)

require('lsp.diagnostics')
