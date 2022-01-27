require('plugins')
require('keybinds')

-- {{{ Utils

require('util.objects')

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

-- {{{ Settings
vim.o.expandtab = true
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

require('consistent-sessions')
require('format-on-save')
require('local-configs')
require('lsp')
require('tabline')
require('util')
