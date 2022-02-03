require('util.map')

vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 0
}

require('nvim-tree').setup({
  open_on_setup = false,
  auto_close = true
})
Nmap('<leader><leader>', '<cmd>NvimTreeFindFileToggle<cr>', true)
