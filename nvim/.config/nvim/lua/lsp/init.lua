local lspconfig = require('lspconfig')
local util = require('util.spread')
local keybinds = require('lsp.keybinds')

-- luasnip setup
local luasnip = require 'luasnip'

--{{{ Configuration

--{{{ Capabilities

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

--}}}

local configuration = {
    capabilities = capabilities,
    on_attach = keybinds.set_keybinds
}

--}}}

--{{{ Configure Language Servers

local servers = { 'pyright', 'clangd', 'bashls', 'vimls', 'cssls' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(configuration)
end

--{{{ stylelint
lspconfig.stylelint_lsp.setup(util.spread(configuration) {
  filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss" }
})
--}}}

--{{{ tsserver

lspconfig.tsserver.setup(util.spread(configuration) {
    on_attach = function(client)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
    keybinds.set_keybinds()
  end
})

--}}}

--{{{ efm

local eslint = {
  lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {
    "%f(%l,%c): %tarning %m",
    "%f(%l,%c): %trror %m"
  },
  lintIgnoreExitCode = true,
  lintSource = "eslint",
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

local prettier = {
  formatCommand = 'prettierd "${INPUT}"',
  formatStdin = true,
  lintSource = "prettier",
  env = {
    string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
  },
}

lspconfig.efm.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
    vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true})
  end,
  root_dir = function()
    if not eslint_config_exists() then
      return nil
    end
    return vim.fn.getcwd()
  end,
  settings = {
    languages = {
      javascript = {prettier, eslint},
      javascriptreact = {prettier, eslint},
      ["javascript.jsx"] ={prettier, eslint},
      typescript ={prettier, eslint},
      ["typescript.tsx"] ={prettier, eslint},
      typescriptreact ={prettier, eslint},
      json = {prettier},
      html = {prettier}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
    "json"
  },
}

--}}}

-- }}}

require('lsp.completion')
require('lsp.diagnostics')
