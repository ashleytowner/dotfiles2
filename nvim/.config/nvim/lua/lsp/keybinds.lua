require('util.map')

local P = {}

function P.set_keybinds()
  nnoremap('<C-]>', '<cmd>Telescope lsp_definitions<CR>', true, true)
  nnoremap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', true, true)
  inoremap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', true, true)
  nnoremap('<leader>.', '<cmd>Telescope lsp_code_actions<CR>', true, true)
  nnoremap('gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', true, true)
  nnoremap('<leader>e', '<cmd>lua diagnostics_popup()<CR>', true, true)
  nnoremap('<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', true, true)
  nnoremap('<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', true, true)
  nnoremap('<leader>q', '<cmd>lua vim.diagnostic.setloclist({open = false})<CR><cmd>Telescope loclist<CR>', true, true)
  nnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', true, true)
  nnoremap('==', 'V:<C-u>lua vim.lsp.buf.range_formatting()<CR>', true, true)
  nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', true, true)
  nnoremap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', true, true)
  nnoremap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', true, true)
  nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', true, true)
  nnoremap('gr', '<cmd>Telescope lsp_references<CR>', true, true)
  vnoremap('=', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', true, true)
end

return P
