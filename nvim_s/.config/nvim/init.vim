" Table of Contents			*vimrc*
"	plugins
"		plugin_config
"	vim_settings
"		keymap
"		filetype_settings
"	functions
"	external

"{{{ Plugins			*plugins*
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


lua << EOF
-- {{{ Plugin Configuration			*plugin_config*

-- Lightline Configuration

vim.g.lightline = {
  colorscheme = 'material',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'gitbranch', 'readonly', 'filename' }
    },
    right = {
      { 'percent' },
      { 'lineinfo' },
      { 'fineencoding', 'filetype' }
    },
  },
  component_function = {
    gitbranch = 'FugitiveHead',
    filename = 'LightlineFilename'
  }
}

-- Treesitter Configuration

require('nvim-treesitter.configs').setup {
    ensure_installed = 'maintained', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        }
    }
}

local parser_config = require ('nvim-treesitter.parsers').get_parser_configs()
parser_config.typescript.used_by = 'javascript.jsx'

-- CoC Extensions

vim.g.coc_global_extensions={
  'coc-css',
  'coc-eslint',
  'coc-html',
  'coc-json',
  'coc-phpls',
  'coc-prettier',
  'coc-python',
  'coc-snippets',
  'coc-sql',
  'coc-stylelintplus',
  'coc-tag',
  'coc-tsserver',
  'coc-vetur'
}

-- Material theme

vim.g.material_style = 'deep ocean'

-- }}}
-- }}}

-- {{{ Settings			*vim_settings*

vim.bo.expandtab = true
vim.o.cindent = true
vim.o.foldlevel = 99
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.listchars = 'tab: |,nbsp:_'
vim.o.number = true
vim.o.pyxversion = 3
vim.o.relativenumber =  true
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.wo.cursorline = true
vim.wo.list = true

vim.cmd('colorscheme material')
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('syntax enable')

-- {{{ Key Remaps			*keymap*

local keymap = vim.api.nvim_set_keymap
keymap('n', '<C-f>', '<cmd>Telescope live_grep<cr>', { noremap = true })
keymap('n', '<C-p>', '<cmd>Telescope find_files find_command=fd,--hidden<cr>', { noremap = true })
keymap('n', '<leader>act', ':CocAction<CR>', { silent = true, noremap=true })
keymap('n', '<leader>err', ':CocDiagnostics<cr>', { noremap = true })
keymap('n', '<leader>gco', '<cmd>Telescope git_branches<cr>', { noremap = true })
keymap('n', '<leader>ls', '<cmd>Telescope buffers<cr>', { noremap = true })
keymap('n', '<leader>rn', '<Plug>(coc-rename)', { noremap = true })
keymap('n', 'J', 'mzJ`z', { noremap = true })
keymap('n', 'K', '<cmd>call ShowDocumentation()<cr>', { silent = true, noremap = true })
keymap('n', 'N', 'Nzz', { noremap = true })
keymap('n', 'Y', 'y$', { noremap = true })
keymap('n', 'gbn', ':bnext<CR>', { silent = true, noremap = true })
keymap('n', 'gbp', ':bprev<CR>', { silent = true, noremap = true })
keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true, noremap = true })
keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true, noremap = true })
keymap('n', 'gr', '<Plug>(coc-references)', { silent = true, noremap = true })
keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true, noremap = true })
keymap('n', 'n', 'nzz', { noremap = true })
keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true });

-- }}}
-- }}}

-- {{{ Functions			*functions*

vim.api.nvim_exec([[
function! ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
]], false)

vim.api.nvim_exec([[
function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
]], false)


-- }}}

-- {{{ External Files			*external*

vim.api.nvim_exec([[
let $LOCALFILE=expand("~/.config/local_override/nvim/init.vim")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
]], false)

vim.api.nvim_exec([[
let $REPOCONFIG=expand('./.vim/init.vim')
if filereadable($REPOCONFIG)
  source $REPOCONFIG
endif
]], false)

-- }}}
EOF
