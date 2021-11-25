"{{{ Plugins
call plug#begin('~/.vim/plugged')

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'mhinz/vim-startify'

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

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

augroup ConsistentSessions
    autocmd!
    autocmd VimLeavePre * mks! $XDG_DATA_HOME/nvim/sessions/Last.vim
augroup END

augroup FormatOnSave
	autocmd!
	autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
augroup END

function! CreateScatchBuffer()
    enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
endfunction

command Scratch call CreateScatchBuffer()

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

set statusline=%n%q\ %t\ %y%m%r\ \|\ %{trim(system('git\ branch\ --show-current'))}%=%<%l:%c\ %P

set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine()
  let s = ''
  " loop through each tab page
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#' " WildMenu
    else
      let s .= '%#TabLine#'
      " let s .= '%#Title#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T '
    " set page number string
    let s .= i + 1 . ''
    " get buffer names and statuses
    let n = ''  " temp str for buf names
    let m = 0   " &modified counter
    let buflist = tabpagebuflist(i + 1)
    " loop through each buffer in a tab
    for b in buflist
      if getbufvar(b, "&buftype") == 'help'
        " let n .= '[H]' . fnamemodify(bufname(b), ':t:s/.txt$//')
      elseif getbufvar(b, "&buftype") == 'quickfix'
        " let n .= '[Q]'
      elseif getbufvar(b, "&modifiable")
        let n .= fnamemodify(bufname(b), ':t') . ', ' " pathshorten(bufname(b))
      endif
      if getbufvar(b, "&modified")
        let m += 1
      endif
    endfor
    " let n .= fnamemodify(bufname(buflist[tabpagewinnr(i + 1) - 1]), ':t')
    let n = substitute(n, ', $', '', '')
    " add modified label
    if m > 0
      let s .= '+'
      " let s .= '[' . m . '+]'
    endif
    if i + 1 == tabpagenr()
      let s .= ' %#TabLineSel#'
    else
      let s .= ' %#TabLine#'
    endif
    " add buffer names
    if n == ''
      let s.= '[No Name]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space
    let s .= ' '
  endfor
  let s .= '%#TabLineFill#%T'
  " right-aligned close button
  " if tabpagenr('$') > 1
  "   let s .= '%=%#TabLineFill#%999Xclose'
  " endif
  return s
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
