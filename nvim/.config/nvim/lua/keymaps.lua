require('util.map')


-- Text manipulation
nnoremap('J', 'mzJ`z')
nnoremap('N', 'Nzz')
nnoremap('n', 'nzz')
vnoremap('J', ':m \'>+1<CR>gv=gv')
vnoremap('K', ':m \'<-2<CR>gv=gv')

-- Clipboard
noremap('<leader>P', '"+P')
noremap('<leader>Y', '"+Y')
noremap('<leader>p', '"+p')
noremap('<leader>y', '"+y')

-- File Navigation
nmap('[q', '<cmd>cprev<cr>')
nmap(']q', '<cmd>cnext<cr>')
nnoremap('<C-PageDown>', ':bnext<CR>')
nnoremap('<C-PageUp>', ':bprev<CR>')

-- Custom text objects
xnoremap('a/', ':lua SelectTextObject("/", "/", true)<cr>')
onoremap('a/', '<cmd>norm va/<cr>')
xnoremap('i/', ':lua SelectTextObject("/", "/", false)<cr>')
onoremap('i/', '<cmd>norm vi/<cr>')

