vim.cmd([[
augroup ConsistentSessions
    autocmd!
    autocmd VimLeavePre * mks! $XDG_DATA_HOME/nvim/sessions/Last.vim
augroup END
]])
