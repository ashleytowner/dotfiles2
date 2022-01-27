function create_keymap(mode, lhs, rhs, noremap, silent)
    local options = {}
    if noremap then
        options.noremap = true
    end

    if silent then
        options.silent = true
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function map(binding, mapping, silent)
  create_keymap('', binding, mapping, false, silent)
end

function noremap(binding, mapping, silent)
  create_keymap('', binding, mapping, true, silent)
end

function nmap(binding, mapping, silent)
  create_keymap('n', binding, mapping, false, silent)
end

function nnoremap(binding, mapping, silent)
  create_keymap('n', binding, mapping, true, silent)
end

function vmap(binding, mapping, silent)
  create_keymap('v', binding, mapping, false, silent)
end

function vnoremap(binding, mapping, silent)
  create_keymap('v', binding, mapping, true, silent);
end

function omap(binding, mapping, silent)
  create_keymap('o', binding, mapping, false, silent)
end

function onoremap(binding, mapping, silent)
  create_keymap('o', binding, mapping, true, silent);
end

function xmap(binding, mapping, silent)
  create_keymap('x', binding, mapping, false, silent)
end

function xnoremap(binding, mapping, silent)
  create_keymap('x', binding, mapping, true, silent);
end
