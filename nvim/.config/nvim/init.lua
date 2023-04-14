vim.g.mapleader = ' '

Util = require('util')
require('plugins')
require('statusline')
require('tabline')

-- auto-sync when plugins file is saved
local packer_user_config_group = vim.api.nvim_create_augroup(
	"PackerUserConfig",
	{ clear = true }
);

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "packer.lua",
	group = packer_user_config_group,
	command = "source <afile> | PackerSync"
})

-- Keybind to update a plugin hash
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "packer.lua",
	group = packer_user_config_group,
	callback = function()
		vim.keymap.set(
			'n',
			'<leader>Up',
			function()
				-- Delete the current hash and yank the plugin name
				vim.cmd('norm 0f=lD^yi\'')
				local plugin_name = vim.fn.getreg('"');
				-- fetch the hash from github
				local hash = require('util').get_plugin_hash(plugin_name);
				-- put the hash back into the " register
				require('util').yank(hash);
				-- Paste the hash and prefix it with a '
				vim.cmd('norm pI\'');
				-- Add ', to the end of the hash
				vim.cmd('norm A\',');
				-- Join the lines and move down to the next line
				vim.cmd('norm kJj');
			end,
			{ buffer = true }
		);
	end
})

-- highlight text on yank
local yank_highlight_group = vim.api.nvim_create_augroup(
	"YankHighlight",
	{ clear = true }
);

vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	group = yank_highlight_group,
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100
		})
	end
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

vim.g.markdown_fenced_languages = {
	"ts=typescript",
	"zsh=zsh",
	"sh=sh",
	"bash=bash",
	"js=javascript"
}

vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('syntax enable')

require('keymaps')
require('setupLocalConfigs')
