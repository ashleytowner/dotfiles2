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
		'lua_ls',
		'pyright',
		'tsserver',
		'vimls',
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
			on_attach = function(client)
				client.server_capabilities.documentFormattingProvider = false
				keymaps.set_keymaps()
			end
		})
	end,
	['lua_ls'] = function(server_name)
		lspConfig[server_name].setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
						}
					}
				}
			}
		})
	end
}

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
