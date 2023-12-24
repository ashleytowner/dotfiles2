vim.g.mapleader = ' '

Util = require('util')
require('plugins')
require('statusline')
require('tabline')
require('bufferline')
require('foldtext')

-- highlight text on yank
local yank_highlight_group =
	vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
	pattern = '*',
	group = yank_highlight_group,
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 100,
		})
	end,
})

vim.o.expandtab = false
vim.o.wildignore = 'node_modules/*'
vim.o.foldlevel = 99
vim.o.hlsearch = false
vim.o.listchars = 'tab:| ,trail:·,nbsp:░'
vim.o.number = true
vim.o.pyxversion = 3
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.wo.cursorline = true
vim.wo.colorcolumn = '80'
vim.wo.list = true
vim.wo.wrap = false
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.signcolumn = 'auto:1-9'
vim.go.statusline = '%!v:lua.StatusLine()'
vim.go.tabline = '%!v:lua.TabLine()'
vim.go.showtabline = 2
vim.o.shell = '/bin/zsh'
vim.o.mouse = ''
vim.go.splitbelow = true
vim.go.splitright = true
vim.o.foldtext = 'v:lua.FoldText()'

if (vim.wo.diff) then
	vim.keymap.set('n', '<leader>1', ':diffget 1<CR>', { noremap = true })
	vim.keymap.set('n', '<leader>2', ':diffget 2<CR>', { noremap = true })
	vim.keymap.set('n', '<leader>3', ':diffget 3<CR>', { noremap = true })
end

vim.g.markdown_fenced_languages = {
	'ts=typescript',
	'zsh=zsh',
	'sh=sh',
	'bash=bash',
	'js=javascript',
}

vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('syntax enable')

require('keymaps')
require('setupLocalConfigs')

if (vim.g.neovide) then
	vim.o.guifont = 'JetBrains Mono:h18'
end
