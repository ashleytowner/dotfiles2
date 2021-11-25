require('objects')

local keymap = vim.api.nvim_set_keymap
keymap('n', '<C-f>', '<cmd>Telescope live_grep<cr>', { noremap = true })
if (vim.g.uname == "Linux\n") then
		keymap('n', '<C-p>', '<cmd>Telescope find_files find_command=fdfind,--hidden,--type,f<cr>', { noremap = true })
else
		keymap('n', '<C-p>', '<cmd>Telescope find_files find_command=fd,--hidden,--type,f<cr>', { noremap = true })
end
keymap('n', '<leader>gco', '<cmd>Telescope git_branches<cr>', { noremap = true })
keymap('n', '<leader>ls', '<cmd>Telescope buffers<cr>', { noremap = true })
keymap('n', '<leader>err', ':lua vim.lsp.diagnostic.show_line_diagnostics({focusable = false})<CR>', { noremap = true, silent = true })
keymap('n', 'J', 'mzJ`z', { noremap = true })
keymap('n', 'N', 'Nzz', { noremap = true })
keymap('n', 'Y', 'y$', { noremap = true })
keymap('n', 'gbn', ':bnext<CR>', { silent = true, noremap = true })
keymap('n', 'gbp', ':bprev<CR>', { silent = true, noremap = true })
keymap('n', 'n', 'nzz', { noremap = true })
keymap('n', '<leader>merge', '<cmd>Gvdiffsplit!<cr>', { noremap=true })
keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })
keymap('', '<leader>y', '"+y', { noremap=true })
keymap('', '<leader>Y', '"+y$', { noremap = true})
keymap('', '<leader>p', '"+p', { noremap=true })
keymap('', '<leader>P', '"+P', { noremap=true })
keymap('n', '<leader><leader>', '<cmd>call ToggleNerdTree()<cr>', {})

keymap('', ',w', '<Plug>CamelCaseMotion_w', { silent = true })
keymap('', ',b', '<Plug>CamelCaseMotion_b', { silent = true })
keymap('', ',b', '<Plug>CamelCaseMotion_b', { silent = true })
keymap('', ',e', '<Plug>CamelCaseMotion_e', { silent = true })
keymap('', 'g,e', '<Plug>CamelCaseMotion_ge', { silent = true })
keymap('o', 'i,w', '<Plug>CamelCaseMotion_iw', { silent = true })
keymap('x', 'i,w', '<Plug>CamelCaseMotion_iw', { silent = true })
keymap('o', 'i,b', '<Plug>CamelCaseMotion_ib', { silent = true })
keymap('x', 'i,b', '<Plug>CamelCaseMotion_ib', { silent = true })
keymap('o', 'i,e', '<Plug>CamelCaseMotion_ie', { silent = true })
keymap('x', 'i,e', '<Plug>CamelCaseMotion_ie', { silent = true })

-- Custom text objects
keymap('x', 'a/', ':lua SelectTextObject("/", "/", true)<cr>', { noremap = true, silent = true })
keymap('o', 'a/', '<cmd>norm va/<cr>', { noremap = true })
keymap('x', 'i/', ':lua SelectTextObject("/", "/", false)<cr>', { noremap = true, silent = true })
keymap('o', 'i/', '<cmd>norm vi/<cr>', { noremap = true })
