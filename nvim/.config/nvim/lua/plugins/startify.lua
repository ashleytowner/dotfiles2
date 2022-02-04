vim.cmd([[
  autocmd VimEnter * if !argc() && !len(getqflist())
                      \ | execute 'Startify' 
                      \ | execute 'NvimTreeOpen' 
                      \ | execute 'wincmd w'
                      \ | endif
]])

vim.cmd([[
  autocmd User StartifyBufferOpened NvimTreeClose
]])
