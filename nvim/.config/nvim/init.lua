--{{{ Plugins
vim.cmd([[
call plug#begin('~/.vim/plugged')

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'ObserverOfTime/coloresque.vim'

" Motions & Objects
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'bkad/CamelCaseMotion'
Plug 'phaazon/hop.nvim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" File Management
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'

" LSP & Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-calc'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'kmyk/brainfuck-highlight.vim'
Plug 'mattn/emmet-vim'
Plug 'onsails/lspkind-nvim'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Theming
Plug 'Iron-E/nvim-highlite'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'haishanh/night-owl.vim'
Plug 'marko-cerovac/material.nvim'
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-nightfly-guicolors'

Plug 'dbeniamine/cheat.sh-vim'

call plug#end()
]])
-- }}}

vim.cmd([[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
]])

vim.cmd([[
function! CreateScatchBuffer()
    enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
endfunction
command! Scratch call CreateScratchBuffer()
]])

require('variables')

-- {{{ Keymaps

require('objects')
vim.g.mapleader=' '

local keymap = vim.api.nvim_set_keymap
keymap('n', '<C-f>', '<cmd>Telescope live_grep<cr>', { noremap = true })
if (vim.g.uname == "Linux\n") then
		keymap('n', '<C-p>', '<cmd>Telescope find_files find_command=fdfind,--hidden,--type,f<cr>', { noremap = true })
else
		keymap('n', '<C-p>', '<cmd>Telescope find_files find_command=fd,--hidden,--type,f<cr>', { noremap = true })
end
keymap('n', '<leader>gco', '<cmd>Telescope git_branches<cr>', { noremap = true })
keymap('n', '<leader>ls', '<cmd>Telescope buffers<cr>', { noremap = true })
keymap('n', 'J', 'mzJ`z', { noremap = true })
keymap('n', 'N', 'Nzz', { noremap = true })
keymap('n', 'Y', 'y$', { noremap = true, silent = true })
keymap('n', '<C-PageDown>', ':bnext<CR>', { silent = true, noremap = true })
keymap('n', '<C-PageUp>', ':bprev<CR>', { silent = true, noremap = true })
keymap('n', 'n', 'nzz', { noremap = true })
keymap('n', '<leader>merge', '<cmd>Gvdiffsplit!<cr>', { noremap=true })
keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })
keymap('', '<leader>y', '"+y', { noremap=true })
keymap('', '<leader>Y', '"+Y', { noremap = true})
keymap('', '<leader>p', '"+p', { noremap=true })
keymap('', '<leader>P', '"+P', { noremap=true })
keymap('n', '<leader><leader>', '<cmd>call ToggleNerdTree()<cr>', {})


-- Hop motions
keymap('n', '<leader>w', '<cmd>HopWord<cr>', {})
keymap('v', '<leader>w', '<cmd>HopWord<cr>', {})

-- CamelCase motions
keymap('', ',w', '<Plug>CamelCaseMotion_w', { silent = true })
keymap('', ',b', '<Plug>CamelCaseMotion_b', { silent = true })
keymap('', ',b', '<Plug>CamelCaseMotion_b', { silent = true })
keymap('', ',e', '<Plug>CamelCaseMotion_e', { silent = true })
keymap('', 'g,e', '<Plug>CamelCaseMotion_ge', { silent = true })
keymap('o', 'i,w', '<Plug>CamelCaseMotion_iw', { silent = true })
keymap('x', 'i,w', '<Plug>CamelCaseMotion_iw', { silent = true })
keymap('o', 'i,b', '<Plug>CamelCaseMotion_ib', { silent = true })
keymap('x', 'i,b', '<Plug>CamelCaseMotion_ib', { silent = true })
keymap('o', 'i,e', '<Plug>CamelCaseMotion_ie', { silent = true })
keymap('x', 'i,e', '<Plug>CamelCaseMotion_ie', { silent = true })

-- Custom text objects
keymap('x', 'a/', ':lua SelectTextObject("/", "/", true)<cr>', { noremap = true, silent = true })
keymap('o', 'a/', '<cmd>norm va/<cr>', { noremap = true })
keymap('x', 'i/', ':lua SelectTextObject("/", "/", false)<cr>', { noremap = true, silent = true })
keymap('o', 'i/', '<cmd>norm vi/<cr>', { noremap = true })

-- }}}

-- {{{ Settings
vim.bo.expandtab = true
vim.o.cindent = true
vim.o.foldlevel = 99
vim.o.hlsearch = false
vim.o.listchars = 'tab:> ,trail:·'
vim.o.number = true
vim.o.pyxversion = 3
vim.o.relativenumber =  true
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.tabstop = 3
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.wo.cursorline = true
vim.wo.colorcolumn = '80'
vim.wo.list = true
vim.wo.wrap = false
vim.go.statusline = '%#Title# ﬘ %n %#StatusLine#%q %t %m%r%y%#fzf3#%{GitBranch()}%#StatusLine#%= %<%-8.(%l:%c%) %-4.(%P%)'
vim.go.tabline='%!MyTabLine()'

if vim.version().minor < 6 then
    vim.o.hidden = true
end

vim.g.markdown_fenced_languages = {
  "ts=typescript",
  "zsh=zsh",
  "sh=sh",
  "bash=bash",
  "js=javascript"
}

vim.cmd('colorscheme nightfly')
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('syntax enable')

-- }}}

-- {{{ Lua Imports

require('consistent-sessions')
require('format-on-save')
require('functions')
require('lsp')
require('plugins')
require('tabline')
require('util')

-- }}}
