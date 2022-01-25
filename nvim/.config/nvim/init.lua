--{{{ Plugins
--Plug 'tpope/vim-commentary'
vim.cmd([[
call plug#begin('~/.vim/plugged')

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'ObserverOfTime/coloresque.vim'

" Motions & Objects
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim'
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
Plug 'folke/tokyonight.nvim'

call plug#end()
]])

-- Plugin Setup
require('Comment').setup()
require('hop').setup()

-- }}}

-- {{{ Utils

require('util/objects')
require('util/map')

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

vim.api.nvim_exec([[
let g:uname = system("uname")
]], false)

if vim.g.started_by_firenvim then
    vim.go.laststatus = 0
end

-- }}}

vim.g.mapleader=' '


-- {{{ Keymaps

vim.g.mapleader=' '

-- Telescope
nnoremap('<C-f>', '<cmd>Telescope live_grep<cr>')
if (vim.g.uname == "Linux\n") then
		nnoremap('<C-p>', '<cmd>Telescope find_files find_command=fdfind,--hidden,--type,f<cr>')
else
		nnoremap('<C-p>', '<cmd>Telescope find_files find_command=fd,--hidden,--type,f<cr>')
end
nnoremap('<leader>gco', '<cmd>Telescope git_branches<cr>')
nnoremap('<leader>ls', '<cmd>Telescope buffers<cr>')

nmap('<leader><leader>', '<cmd>call ToggleNerdTree()<cr>')
nnoremap('<leader>merge', '<cmd>Gvdiffsplit!<cr>')

-- Text manipulation
nnoremap('J', 'mzJ`z')
nnoremap('N', 'Nzz')
nnoremap('n', 'nzz')
vnoremap('J', ':m \'>+1<CR>gv=gv')
vnoremap('K', ':m \'<-2<CR>gv=gv')

-- Clipboard
noremap('<leader>P', '"+P')
noremap('<leader>Y', '"+Y')
noremap('<leader>p', '"+p')
noremap('<leader>y', '"+y')

-- File Navigation
nmap('[q', '<cmd>cprev<cr>')
nmap(']q', '<cmd>cnext<cr>')
nnoremap('<C-PageDown>', ':bnext<CR>')
nnoremap('<C-PageUp>', ':bprev<CR>')

-- Hop motions
nmap('<leader>w', '<cmd>HopWord<cr>')
vmap('<leader>w', '<cmd>HopWord<cr>')

-- CamelCase motions
map(',w', '<Plug>CamelCaseMotion_w')
map(',b', '<Plug>CamelCaseMotion_b')
map(',b', '<Plug>CamelCaseMotion_b')
map(',e', '<Plug>CamelCaseMotion_e')
map('g,e', '<Plug>CamelCaseMotion_ge')
map('i,w', '<Plug>CamelCaseMotion_iw')
map('i,w', '<Plug>CamelCaseMotion_iw')
map('i,b', '<Plug>CamelCaseMotion_ib')
map('i,b', '<Plug>CamelCaseMotion_ib')
map('i,e', '<Plug>CamelCaseMotion_ie')
map('i,e', '<Plug>CamelCaseMotion_ie')

-- Custom text objects
xnoremap('a/', ':lua SelectTextObject("/", "/", true)<cr>')
onoremap('a/', '<cmd>norm va/<cr>')
xnoremap('i/', ':lua SelectTextObject("/", "/", false)<cr>')
onoremap('i/', '<cmd>norm vi/<cr>')

-- }}}

-- {{{ Settings
vim.bo.expandtab = true
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
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
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

vim.g.coloresque_whitelist = { 
  'css',
  'haml',
  'html',
  'htmldjango',
  'javascript',
  'lua',
  'jsx',
  'less', 
  'php',
  'postcss',
  'pug',
  'qml',
  'sass',
  'scss',
  'sh',
  'stylus',
  'svg',
  'typescript',
  'vim',
  'vue',
  'xml',
  'conf'
}

vim.g.tokyonight_style = "night"
vim.cmd('colorscheme tokyonight')

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
