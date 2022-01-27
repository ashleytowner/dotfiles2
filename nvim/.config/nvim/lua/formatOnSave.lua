vim.cmd([[
augroup FormatOnSave
	autocmd!
	autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
augroup END
]])
