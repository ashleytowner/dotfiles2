local keymaps = require('lsp.keymaps')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local masonLspOk, masonLsp = pcall(require, 'mason-lspconfig');
local lspConfigOk, lspConfig = pcall(require, 'lspconfig');

if not (masonLspOk or lspConfigOk) then
	return
end

masonLsp.setup({
	ensure_installed = {
		'bashls',
		'clangd',
		'cssls',
		'html',
		'sumneko_lua',
		'pyright',
		'tsserver',
		'vimls',
		'yamlls',
	}
})

masonLsp.setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name)
		lspConfig[server_name].setup({
			on_attach = function()
				keymaps.set_keymaps()
			end,
		})
	end,
	['tsserver'] = function(server_name)
		lspConfig[server_name].setup({
			on_attach = function(client, bufnr)
				keymaps.set_keymaps()

				local twoslashQueriesOk, twoslashQueries = pcall(require, 'twoslash-queries');
				if not twoslashQueriesOk then
					return;
				end
				twoslashQueries.attach(client, bufnr);
				twoslashQueries.enable();

				vim.keymap.set(
					'n',
					'<leader>?',
					'<cmd>InspectTwoslashQueries<cr>',
					{ noremap = true, buffer = true }
				);

				vim.keymap.set(
					'n',
					'<leader><bs>?',
					'<cmd>RemoveTwoslashQueries<cr>',
					{ noremap = true, buffer = true }
				);
			end
		})
	end
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
	border = "rounded",
}
);

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
	vim.lsp.handlers.signature_help, {
	border = "rounded"
}
);

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
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
