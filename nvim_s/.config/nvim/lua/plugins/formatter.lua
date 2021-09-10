local function prettier()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

local formatterConfig = {
    logging = true,
    filetype = {
        typescriptreact = {
            prettier
        },
        typescript = {
            prettier
        },
        javascript = {
            prettier
        },
        javascriptreact = {
            prettier
        },
        ['javascript.jsx'] = {
            prettier
        },
        ['typescript.jsx'] = {
            prettier
        }
    }
}

require('formatter').setup(formatterConfig)
