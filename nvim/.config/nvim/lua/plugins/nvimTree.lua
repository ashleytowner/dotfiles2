require('util.map')

vim.g.nvim_tree_quit_on_open = 1

require('nvim-tree').setup({})
nmap('<leader><leader>', '<cmd>NvimTreeFindFileToggle<cr>', true)
