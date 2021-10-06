local function prettierd()
    return {
        exe = "prettierd",
        args = {string.format("\"%s\"", vim.api.nvim_buf_get_name(0))},
        stdin = true
    }
end

local function prettier()
  return {
    exe = "prettier",
    args = {string.format("\"%s\"", vim.api.nvim_buf_get_name(0))},
    stdin = true
  }
end

local formatterConfig = {
    logging = true,
    filetype = {
        typescriptreact = {
            prettierd
        },
        typescript = {
            prettierd
        },
        javascript = {
            prettierd
        },
        javascriptreact = {
            prettierd
        },
        html = {
            prettierd
        },
        ['javascript.jsx'] = {
            prettierd
        },
        ['typescript.tsx'] = {
            prettierd
        },
        markdown = {
          prettier
        }
    }
}

require('formatter').setup(formatterConfig)
