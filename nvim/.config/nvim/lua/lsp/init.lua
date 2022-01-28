local lspconfig = require('lspconfig')
local util = require('util.spread')
local linters = require('lsp.linters')
local configuration = require('lsp.configuration')
local keybinds = require('lsp.keybinds')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Server Configuration
local servers = {
  'pyright',
  'clangd',
  'bashls',
  'vimls',
  'cssls',
  { 'graphql',
    config = {
      cmd = { "graphql-lsp", "server", "-m", "stream", "-s", vim.fn.glob('**/graphql.schema.json') }
    }
  },
  { 'stylelint_lsp',
    config = {
      filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss" }
    }
  },
  { 'tsserver',
    config = {
      on_attach = function(client)
        if client.config.flags then
          client.config.flags.allow_incremental_sync = true
        end
        client.resolved_capabilities.document_formatting = false
        keybinds.set_keybinds()
      end
    }
  },
  { 'efm',
    override = true,
    config = {
      on_attach = function(client)
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.goto_definition = false
        vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true})
      end,
      root_dir = function()
        if not linters.eslint_config_exists() then
          return nil
        end
        return vim.fn.getcwd()
      end,
      settings = {
        languages = {
          javascript = {linters.prettier, linters.eslint},
          javascriptreact = {linters.prettier, linters.eslint},
          ["javascript.jsx"] ={linters.prettier, linters.eslint},
          typescript ={linters.prettier, linters.eslint},
          ["typescript.tsx"] ={linters.prettier, linters.eslint},
          typescriptreact ={linters.prettier, linters.eslint},
          json = {linters.prettier},
          html = {linters.prettier}
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
  },
  { "sumneko_lua",
    config = {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = runtime_path
          },
          diagnostics = {
            globals = {"vim"}
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true)
          },
          telemetry = {
            enable = false
          }
        }
      }
    }
  }
}

-- Run the setup for each server
for _, lsp in ipairs(servers) do
  if type(lsp) == "string" then
    lspconfig[lsp].setup(configuration)
  elseif lsp.override then
    lspconfig[lsp[1]].setup(lsp.config)
  else
    lspconfig[lsp[1]].setup(util.spread(configuration)(lsp.config))
  end
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
 vim.lsp.handlers.hover, {
   -- Use a sharp border with `FloatBorder` highlights
   border = "single"
 }
)

require('lsp.completion')
require('lsp.diagnostics')
