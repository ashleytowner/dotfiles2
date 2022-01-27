require('util.map')

local P = {}

function P.set_keybinds()
  nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', true)
  nnoremap('<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', true)
  nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', true)
  nnoremap('<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', true)
  nnoremap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', true)
  nnoremap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', true)
  nnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', true)
  nnoremap('<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>', true)
  nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', true)
  nnoremap('<leader>e', '<cmd>lua diagnostics_popup()<CR>', true)
  nnoremap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', true)
  nnoremap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', true)
  nnoremap('<leader>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', true)
  nnoremap('<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', true)
  vnoremap('=', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', true)
  nnoremap('==', 'V:<C-u>lua vim.lsp.buf.range_formatting()<CR>', true)
end

return P
