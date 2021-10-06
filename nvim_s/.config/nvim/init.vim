"{{{ Plugins
call plug#begin('~/.vim/plugged')

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Motions & Objects
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" File Management
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'

" Syntax & Completion
Plug 'clones/vim-zsh'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'ianks/vim-tsx'
Plug 'jparise/vim-graphql'
Plug 'kmyk/brainfuck-highlight.vim'
Plug 'L3MON4D3/LuaSnip'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'stanangeloff/php.vim'
Plug 'vim-scripts/SQLUtilities'

" Linting
Plug 'eslint/eslint'
Plug 'stylelint/stylelint'

" Formatting
Plug 'mhartington/formatter.nvim'

" Theming
Plug 'Iron-E/nvim-highlite'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'haishanh/night-owl.vim'
Plug 'itchyny/lightline.vim'
Plug 'marko-cerovac/material.nvim'
Plug 'morhetz/gruvbox'


Plug 'dbeniamine/cheat.sh-vim'

call plug#end()

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

augroup FormatAutoGroup
    autocmd!
    " autocmd BufWritePre * silent lua vim.lsp.buf.formatting()
    autocmd BufWritePost * silent FormatWrite
augroup END

augroup ErrorOnHoverAutoGroup
    autocmd!
augroup END

" }}}

function! ToggleNerdTree()
    if g:NERDTree.IsOpen()
        NERDTreeToggle
    else
        if @% == ""
            NERDTreeToggle
        else
            NERDTreeFind
            norm zz
        endif
    endif
endfunction

" {{{ Lua Imports
lua << EOF

require('variables')
require('settings')
require('keymaps')
require('functions')
require('plugins')
require('lsp')

EOF
" }}}
