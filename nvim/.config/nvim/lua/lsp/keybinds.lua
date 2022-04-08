require('util.map')

local P = {}

function P.set_keybinds()
  Nnoremap('<C-]>', '<cmd>Telescope lsp_definitions<CR>', true, true)
  Nnoremap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', true, true)
  Inoremap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', true, true)
  Nnoremap('<leader>.', '<cmd>Telescope lsp_code_actions<CR>', true, true)
  Nnoremap('gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', true, true)
  Nnoremap('<leader>e', '<cmd>lua diagnostics_popup()<CR>', true, true)
  Nnoremap('<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', true, true)
  Nnoremap('<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', true, true)
  Nnoremap('<leader>q', '<cmd>lua vim.diagnostic.setloclist({open = false})<CR><cmd>Telescope loclist<CR>', true, true)
  Nnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', true, true)
  Nnoremap('==', 'V:<C-u>lua vim.lsp.buf.range_formatting()<CR>', true, true)
  Nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', true, true)
  Nnoremap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', true, true)
  Nnoremap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', true, true)
  Nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', true, true)
  Nnoremap('gr', '<cmd>Telescope lsp_references<CR>', true, true)
  Vnoremap('=', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', true, true)
end

return P
