local P = {}

function P.set_keymaps()
	vim.keymap.set(
		'n',
		'<C-k>',
		vim.lsp.buf.signature_help,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'i',
		'<C-k>',
		vim.lsp.buf.signature_help,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'K',
		vim.lsp.buf.hover,
		{ noremap = true, silent = true, buffer = true }
	);


	vim.keymap.set(
		'n',
		'<leader>.',
		vim.lsp.buf.code_action,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		']t',
		vim.lsp.buf.type_definition,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'[d',
		vim.diagnostic.goto_prev,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		']d',
		vim.diagnostic.goto_next,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'<leader>e',
		function()
			local formatFunction = function(d) return '[' .. d.source .. '] ' end
			vim.diagnostic.open_float(nil, { prefix = formatFunction })
		end,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'<leader>=',
		vim.lsp.buf.format,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'<leader>gi',
		vim.lsp.buf.implementation,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'<leader>rn',
		vim.lsp.buf.rename,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'gD',
		vim.lsp.buf.declaration,
		{ noremap = true, silent = true, buffer = true }
	);

end

return P
