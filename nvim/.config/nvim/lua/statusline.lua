vim.cmd([[
function! GetFileIcon()
  lua icon = require('nvim-web-devicons').get_icon(vim.fn.expand('%:t'), vim.fn.expand('%:e'), { default = true })
  lua vim.g.fileIcon = icon
  let icon = g:fileIcon
  lua vim.g.fileIcon = nil
  return icon
endfunction
]])
