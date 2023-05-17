local lspkind = require('lspkind')

lspkind.init()

local cmp = require('cmp')
cmp.setup {
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-g><CR>'] = cmp.mapping(function()
			if (vim.g.ai == 'copilot') then
				vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<CR>', true, true, false)), 'n', false)
			end
			if (vim.g.ai == 'codeium') then
				vim.api.nvim_feedkeys(vim.fn['codeium#Accept'](), 'n', false)
			end
		end)
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'vsnip' },
		{ name = 'calc' },
	}),
	formatting = {
		format = lspkind.cmp_format({
			with_text = false,
			menu = {
				buffer = '[buf]',
				nvim_lsp = '[LSP]',
				path = '[path]',
				calc = '[calc]',
				vsnip = '[vsnip]'
			}
		})
	},
	experimental = {
		ghost_text = false
	}
}
