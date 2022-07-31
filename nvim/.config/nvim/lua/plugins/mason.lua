local M = {}

function M.run()
  local programs = {
    'bash-language-server',
    'clangd',
    'css-lsp',
    'efm',
    'eslint_d',
    'html-lsp',
    'lua-language-server',
    'prettierd',
    'pyright',
    'stylelint-lsp',
    'typescript-language-server',
    'vim-language-server',
    'yaml-language-server'
  }

  local cmdString = 'MasonInstall'

  for i in ipairs(programs)
  do
    cmdString = cmdString .. ' ' .. programs[i]
  end

  vim.cmd(cmdString)

end

return M
