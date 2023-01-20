local P = {}

local tscpOk, tscp = pcall(require, 'telescope.builtin');

function P.set_keymaps()
	vim.keymap.set(
		{ 'n', 'i' },
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
		'<leader>d',
		function()
			local formatFunction = function(d) return '[' .. d.source .. '] ' end
			vim.diagnostic.open_float(nil, { prefix = formatFunction, border = "rounded" })
		end,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'<leader>D',
		function()
			if (tscpOk) then
				tscp.diagnostics();
			else
				vim.diagnostic.setqflist();
			end
		end,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'g=',
		vim.lsp.buf.format,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		{ 'v' },
		'=',
		vim.lsp.buf.format,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'==',
		function()
			local line = vim.fn.getcurpos()[2];

			vim.lsp.buf.format({
				range = {
					['start'] = { line, 0 },
					['end'] = { line, 10000 }
				}
			});
		end,
		{ noremap = true, silent = true, buffer = true }
	)

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

	vim.keymap.set(
		'n',
		'<C-]>',
		function()
			if (tscpOk) then
				tscp.lsp_definitions();
			else
				vim.lsp.buf.definition();
			end
		end,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		']r',
		function()
			if (tscpOk) then
				tscp.lsp_references();
			else
				vim.lsp.buf.references();
			end
		end,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'<leader>sym',
		function()
			if (tscpOk) then
				tscp.lsp_document_symbols();
			else
				vim.lsp.buf.document_symbol();
			end
		end,
		{ noremap = true, silent = true, buffer = true }
	);

	vim.keymap.set(
		'n',
		'<leader>Sym',
		function()
			if (tscpOk) then
				tscp.lsp_dynamic_workspace_symbols();
			else
				vim.lsp.buf.workspace_symbol();
			end
		end,
		{ noremap = true, silent = true, buffer = true }
	);
end

return P
