vim.g.mapleader=' '

vim.api.nvim_exec([[
  let g:uname = system("uname")
]], false)

require('plugins')

vim.cmd([[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
]])

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
vim.go.statusline = '%#Title# ﬘ %n %#StatusLine#%q %t %m%r%y%#fzf3#%{GitBranch()}%#StatusLine#%= %<%-8.(%l:%c%) %-4.(%P%)'
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
require('tabline')
require('util')
