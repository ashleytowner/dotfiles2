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

"{{{ NerdTree
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
"}}}


"{{{ Statusline

" Return the git branch
function! GitBranch()
  let branch = trim(system('git branch --show-current 2> /dev/null'))
  if (branch == '')
    return ""
  else
    return " " . branch
  endif
endfunction
set statusline=\ ﬘\ %n\ %q\ %t\ %y%-3.(%m%)%r%=%{GitBranch()}%=\ %<%-8.(%l:%c%)\ %-4.(%P%)
"}}}

"{{{ Tabline
set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine()
  let tablineValue = ''
  " loop through each tab page
  for tab in range(tabpagenr('$'))
    if tab + 1 == tabpagenr()
      let tablineValue .= '%#TabLineSel#'
    else
      let tablineValue .= '%#TabLine#'
    endif
    if tab + 1 == tabpagenr()
      let tablineValue .= '%#TabLineSel#' " WildMenu
    else
      let tablineValue .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let tablineValue .= '%' . (tab + 1) . 'T '
    " set page number string
    let tablineValue .= tab + 1 . ''
    " get buffer names and statuses
    let tabname = ''  " temp str for buf names
    let isModified = 0   " &modified counter
    let buflist = tabpagebuflist(tab + 1)
    " loop through each buffer in a tab
    for b in buflist
      let buffername = bufname(b)
      let buffertype = getbufvar(b, "&buftype")
      if buffername == ''
          if buffertype ==? 'nofile'
              let buffername = '[Scratch]'
          else
              let buffername = '[No Name]'
          endif
      endif

      if getbufvar(b, "&modifiable") || buffertype == 'terminal'
        let tabname .= fnamemodify(buffername, ':t') . ', '
      endif
      if getbufvar(b, "&modified")
        let isModified += 1
      endif
    endfor
    let tabname = substitute(tabname, ', $', '', '')
    if tab + 1 == tabpagenr()
      let tablineValue .= ' %#TabLineSel#'
    else
      let tablineValue .= ' %#TabLine#'
    endif
    " add buffer names
    let tablineValue .= tabname
    if isModified > 0
      let tablineValue .= ' [+]'
    endif
    " switch to no underlining and add final space
    let tablineValue .= ' %#TabLine#|'
  endfor
  let tablineValue .= '%#TabLineFill#%T'
  return tablineValue
endfunction

let g:coloresque_whitelist = [ 'css', 'haml', 'html', 'htmldjango', 'javascript', 'jsx', 'less', 'php', 'postcss', 'pug', 'qml', 'sass', 'scss', 'sh', 'stylus', 'svg', 'typescript', 'vim', 'vue', 'xml', 'conf']
"}}}

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
