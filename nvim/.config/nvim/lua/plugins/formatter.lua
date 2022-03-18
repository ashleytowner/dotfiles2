local prettier = {
  function()
    return {
      exe = "prettierd",
      args = {vim.api.nvim_buf_get_name(0)},
      stdin = true
    }
  end
}

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = prettier,
    javascriptreact = prettier,
    ['javascript.jsx'] = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    ['typescript.tsx'] = prettier,
    html = prettier
  }
})

-- vim.cmd([[
-- augroup FormatOnSave
--   autocmd!
--   autocmd BufWritePost * lua vim.lsp.buf.formatting_sync()
-- augroup END
-- ]])
