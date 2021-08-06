"{{{ Plugins
call plug#begin('~/.vim/plugged')

" Motions & Objects
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
 
" File Management
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Syntax & Completion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'elzr/vim-json'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'vim-scripts/SQLUtilities'
Plug 'stanangeloff/php.vim'
Plug 'kmyk/brainfuck-highlight.vim'
Plug 'jparise/vim-graphql'
Plug 'clones/vim-zsh'

" Linting
Plug 'stylelint/stylelint'
Plug 'eslint/eslint'

" Theming
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'haishanh/night-owl.vim'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'marko-cerovac/material.nvim'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'Iron-E/nvim-highlite'

call plug#end()

" }}}

" {{{ Lua Imports
lua << EOF

require('variables')
require('settings')
require('keymaps')
require('functions')
require('plugins')

EOF
" }}}
