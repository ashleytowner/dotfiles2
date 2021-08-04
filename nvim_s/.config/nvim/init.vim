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



"{{{ Plugin Configuration			*plugin_config*

" lightline
let g:lightline = {
    \   'colorscheme': 'material',
    \   'active': {
    \     'left': [
    \               [ 'mode', 'paste' ],
    \               [ 'gitbranch', 'readonly', 'filename' ]
    \             ],
    \     'right': [
    \               [ 'percent' ],
    \               [ 'lineinfo' ],
    \               [ 'fileencoding', 'filetype' ]
    \              ]
    \   },
    \   'component_function': {
    \     'gitbranch': 'FugitiveHead',
    \     'filename': 'LightlineFilename'
    \   },
    \ }


" Code Formatting
let g:yats_host_keyword = 1

" TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        }
    }
}
EOF

" table.insert(parser_config.typescript.used_by, "javascript.jsx")
lua <<EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.typescript.used_by = "javascript.jsx"
EOF

" material theme
let g:material_style = 'deep ocean'

" CoC
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint', 
  \ 'coc-html',
  \ 'coc-json', 
  \ 'coc-phpls',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-snippets',
  \ 'coc-sql',
  \ 'coc-stylelintplus',
  \ 'coc-tag',
  \ 'coc-tsserver',
  \ 'coc-vetur'
  \ ]

" fugitive
" set diffopt+=vertical "make diffs vertical

"}}}
"}}}

"{{{ Settings			*vim_settings*

colorscheme material
set cindent
set cursorline 
set expandtab 
set hidden 
set list
set listchars=tab:▸\ ,nbsp:_ 
set nohlsearch
set number 
set pyxversion=3
set relativenumber 
set shiftwidth=2
set smarttab
set tabstop=2
set termguicolors
set updatetime=300
set foldlevel=99
filetype on
filetype plugin on
syntax enable

"{{{ Key Remaps			*keymap*

nmap <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>act :CocAction<CR>
nmap <silent> gbn :bnext<CR>
nmap <silent> gbp :bprev<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files({ find_command={ 'fd','--hidden' } })<cr>
nnoremap <leader>ls <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>gco <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap J mzJ`z
nnoremap N Nzz
nnoremap Y y$
nnoremap n nzz
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv

"}}}
"}}}

"{{{ Functions			*functions*

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

"}}}

"{{{ External Files			*external*
let $LOCALFILE=expand("~/.config/local_override/nvim/init.vim")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

let $REPOCONFIG=expand('./.vim/init.vim')
if filereadable($REPOCONFIG)
  source $REPOCONFIG
endif
"}}}
