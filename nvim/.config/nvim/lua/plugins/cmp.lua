local lspkind = require('lspkind')
local luasnip_err, _ = pcall(require, 'luasnip')

lspkind.init()

local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete({}), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'vsnip' },
    { name = 'buffer' },
    { name = 'calc' },
    (not luasnip_err and { name = 'luasnip' } or nil)
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        path = "[path]",
        luasnip = "[snip]",
        calc = "[calc]"
      }
    })
  }
}
