local function prettier()
    return {
        exe = "prettierd",
        args = {vim.api.nvim_buf_get_name(0)},
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
        html = {
            prettier
        },
        ['javascript.jsx'] = {
            prettier
        },
        ['typescript.tsx'] = {
            prettier
        }
    }
}

require('formatter').setup(formatterConfig)
