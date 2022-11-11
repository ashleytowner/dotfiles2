local mason_null_ls = require('mason-null-ls')

mason_null_ls.setup({
  automatic_setup = true,
})

mason_null_ls.setup_handlers({
  function(source, methods)
    require('mason-null-ls.automatic_setup')(source, methods)
  end
})
