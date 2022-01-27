require('util.map')

vim.g.mapleader=' '

-- Telescope
nnoremap('<C-f>', '<cmd>Telescope live_grep<cr>')
if (vim.g.uname == "Linux\n") then
		nnoremap('<C-p>', '<cmd>Telescope find_files find_command=fdfind,--hidden,--type,f<cr>')
else
		nnoremap('<C-p>', '<cmd>Telescope find_files find_command=fd,--hidden,--type,f<cr>')
end
nnoremap('<leader>gco', '<cmd>Telescope git_branches<cr>')
nnoremap('<leader>ls', '<cmd>Telescope buffers<cr>')

nmap('<leader><leader>', '<cmd>call ToggleNerdTree()<cr>')
nnoremap('<leader>merge', '<cmd>Gvdiffsplit!<cr>')

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

-- Hop motions
nmap('<leader>w', '<cmd>HopWord<cr>')
vmap('<leader>w', '<cmd>HopWord<cr>')

-- CamelCase motions
map(',w', '<Plug>CamelCaseMotion_w')
map(',b', '<Plug>CamelCaseMotion_b')
map(',e', '<Plug>CamelCaseMotion_e')
map('g,e', '<Plug>CamelCaseMotion_ge')
xmap('i,w', '<Plug>CamelCaseMotion_iw')
xmap('i,b', '<Plug>CamelCaseMotion_ib')
xmap('i,e', '<Plug>CamelCaseMotion_ie')

-- Custom text objects
xnoremap('a/', ':lua SelectTextObject("/", "/", true)<cr>')
onoremap('a/', '<cmd>norm va/<cr>')
xnoremap('i/', ':lua SelectTextObject("/", "/", false)<cr>')
onoremap('i/', '<cmd>norm vi/<cr>')

