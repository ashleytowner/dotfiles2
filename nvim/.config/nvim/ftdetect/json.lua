if vim.o.filetype == '' and vim.fn.expand('%:e') == 'mcmeta' then
	vim.o.filetype = 'json'
end
