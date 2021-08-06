vim.g.coc_global_extensions={
	'coc-css',
	'coc-eslint',
	'coc-html',
	'coc-json',
	'coc-phpls',
	'coc-prettier',
	'coc-python',
	'coc-snippets',
	'coc-sql',
	'coc-stylelintplus',
	'coc-tag',
	'coc-tsserver',
	'coc-vetur'
}

vim.api.nvim_exec([[
function! ShowDocumentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
]], false)
