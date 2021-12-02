"{{{ Plugins
call plug#begin('~/.vim/plugged')

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'ObserverOfTime/coloresque.vim'

" Motions & Objects
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'bkad/CamelCaseMotion'

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
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'kmyk/brainfuck-highlight.vim'
Plug 'mattn/emmet-vim'

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


lua << EOF

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
]])

vim.cmd("command Scratch call CreateScatchBuffer()")
EOF


"}}}

lua << EOF
vim.g.coloresque_whitelist = { 'css', 'haml', 'html', 'htmldjango', 'javascript', 'jsx', 'less', 'php', 'postcss', 'pug', 'qml', 'sass', 'scss', 'sh', 'stylus', 'svg', 'typescript', 'vim', 'vue', 'xml', 'conf' }
EOF

" {{{ Lua Imports
lua << EOF

require('consistent-sessions')
require('format-on-save')
require('functions')
require('keymaps')
require('lsp')
require('objects')
require('plugins')
require('settings')
require('tabline')
require('util')
require('variables')

EOF
" }}}
