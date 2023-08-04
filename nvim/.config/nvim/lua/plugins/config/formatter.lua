require('formatter').setup({
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
	},
})

vim.keymap.set(
	'n',
	'g=',
	'<CMD>Format<CR>',
	{ noremap = true, silent = true }
)

vim.keymap.set(
	{ 'v' },
	'=',
	"<CMD>'<,'>Format<CR>",
	{ noremap = true, silent = true }
)
