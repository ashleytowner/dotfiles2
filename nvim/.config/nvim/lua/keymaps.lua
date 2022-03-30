require('util.map')


-- Text manipulation
Nnoremap('J', 'mzJ`z')
Nnoremap('N', 'Nzz')
Nnoremap('n', 'nzz')
Vnoremap('J', ':m \'>+1<CR>gv=gv')
Vnoremap('K', ':m \'<-2<CR>gv=gv')

-- Clipboard
Noremap('<leader>P', '"+P')
Noremap('<leader>Y', '"+y$')
Noremap('<leader>p', '"+p')
Noremap('<leader>y', '"+y')

-- File Navigation
Nmap('[q', '<cmd>cprev<cr>')
Nmap(']q', '<cmd>cnext<cr>')
Nnoremap('<C-PageDown>', ':bnext<CR>')
Nnoremap('<C-PageUp>', ':bprev<CR>')
Nnoremap('gw', '<C-w>w')
Nnoremap('gW', '<C-w>W')

Tnoremap('<C-\\>', '<C-\\><C-n><C-w>w')
Tnoremap('<C-n>', '<C-\\><C-n>')

-- Custom text objects
-- Xnoremap('a/', ':lua SelectTextObject("/", "/", true)<cr>')
-- Onoremap('a/', '<cmd>norm va/<cr>')
-- Xnoremap('i/', ':lua SelectTextObject("/", "/", false)<cr>')
-- Onoremap('i/', '<cmd>norm vi/<cr>')

