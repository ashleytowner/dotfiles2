vim.g.mapleader=' '

Util = require('util')
require('plugins')
require('statusline')
require('tabline')

vim.g.uname = Util.system('uname')

-- auto-sync when plugins file is saved
vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost packer.lua source <afile> | PackerSync
augroup end
]])

-- {{{ Settings
vim.o.expandtab = true
vim.o.wildignore = 'node_modules/*'
vim.o.foldlevel = 99
vim.o.hlsearch = false
vim.o.listchars = 'tab: ,trail:·'
vim.o.number = true
vim.o.pyxversion = 3
vim.o.relativenumber =  true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.tabstop = 3
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.wo.cursorline = true
vim.wo.colorcolumn = '80'
vim.wo.list = true
vim.wo.wrap = false
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.signcolumn='auto:1-9'
vim.go.statusline = '%!v:lua.StatusLine()'
vim.go.tabline='%!MyTabLine()'

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

-- }}}

require('consistentSessions')
require('formatOnSave')
require('keymaps')
require('setupLocalConfigs')
