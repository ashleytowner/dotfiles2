local function create_keymap(mode, lhs, rhs, noremap, silent, buffer)
    local options = {}
    if noremap then
        options.noremap = true
    end

    if silent then
        options.silent = true
    end

    if buffer then
      vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
      return
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function map(binding, mapping, silent, buffer)
  create_keymap('', binding, mapping, false, silent, buffer)
end

function noremap(binding, mapping, silent, buffer)
  create_keymap('', binding, mapping, true, silent, buffer)
end

function nmap(binding, mapping, silent, buffer)
  create_keymap('n', binding, mapping, false, silent, buffer)
end

function nnoremap(binding, mapping, silent, buffer)
  create_keymap('n', binding, mapping, true, silent, buffer)
end

function vmap(binding, mapping, silent, buffer)
  create_keymap('v', binding, mapping, false, silent, buffer)
end

function vnoremap(binding, mapping, silent, buffer)
  create_keymap('v', binding, mapping, true, silent, buffer)
end

function omap(binding, mapping, silent, buffer)
  create_keymap('o', binding, mapping, false, silent, buffer)
end

function onoremap(binding, mapping, silent, buffer)
  create_keymap('o', binding, mapping, true, silent, buffer)
end

function xmap(binding, mapping, silent, buffer)
  create_keymap('x', binding, mapping, false, silent, buffer)
end

function xnoremap(binding, mapping, silent, buffer)
  create_keymap('x', binding, mapping, true, silent, buffer)
end

function imap(binding, mapping, silent, buffer)
  create_keymap('i', binding, mapping, false, silent, buffer)
end

function inoremap(binding, mapping, silent, buffer)
  create_keymap('i', binding, mapping, true, silent, buffer)
end
