function map(binding, mapping)
  vim.api.nvim_set_keymap('', binding, mapping, {})
end

function noremap(binding, mapping)
  vim.api.nvim_set_keymap('', binding, mapping, { noremap = true });
end

function nmap(binding, mapping)
  vim.api.nvim_set_keymap('n', binding, mapping, {})
end

function nnoremap(binding, mapping)
  vim.api.nvim_set_keymap('n', binding, mapping, { noremap = true });
end

function vmap(binding, mapping)
  vim.api.nvim_set_keymap('v', binding, mapping, {})
end

function vnoremap(binding, mapping)
  vim.api.nvim_set_keymap('v', binding, mapping, { noremap = true });
end

function omap(binding, mapping)
  vim.api.nvim_set_keymap('o', binding, mapping, {})
end

function onoremap(binding, mapping)
  vim.api.nvim_set_keymap('o', binding, mapping, { noremap = true });
end

function xmap(binding, mapping)
  vim.api.nvim_set_keymap('x', binding, mapping, {})
end

function xnoremap(binding, mapping)
  vim.api.nvim_set_keymap('x', binding, mapping, { noremap = true });
end
