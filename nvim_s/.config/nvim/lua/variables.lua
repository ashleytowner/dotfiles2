vim.g.mapleader=' '

vim.api.nvim_exec([[
let g:uname = system("uname")
]], false)

vim.g.material_style = 'deep ocean'

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrowCollapsible = '-'
vim.g.NERDTreeDirArrowExpandable = '+'

if vim.g.started_by_firenvim then
    vim.go.laststatus = 0
end
