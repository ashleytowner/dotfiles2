local config = {
	logging = false,
	filetype = {
		javascript = require('formatter.filetypes.javascript').prettierd,
		javascriptreact = require('formatter.filetypes.javascriptreact').prettierd,
		typescript = require('formatter.filetypes.typescript').prettierd,
		typescriptreact = require('formatter.filetypes.typescriptreact').prettierd,
		html = require('formatter.filetypes.html').prettierd,
		json = require('formatter.filetypes.json').jq,
		lua = require('formatter.filetypes.lua').stylua,
		css = require('formatter.filetypes.css').prettierd,
		scss = require('formatter.filetypes.css').prettierd,
		python = require('formatter.filetypes.python').black,
	},
}

require('formatter').setup(config)

local function has_formatter()
	local ft = vim.bo.filetype
	for k, _ in pairs(config.filetype) do
		if ft == k then
			return true
		end
	end
end

vim.keymap.set(
	'n',
	'g=',
	function()
		if (has_formatter()) then
			vim.cmd([[<CMD>Format<CR>]])
		else
			vim.lsp.buf.format()
		end
	end,
	{ noremap = true, silent = true }
)

vim.keymap.set(
	{ 'v' },
	'=',
	"<CMD>'<,'>Format<CR>",
	{ noremap = true, silent = true }
)
