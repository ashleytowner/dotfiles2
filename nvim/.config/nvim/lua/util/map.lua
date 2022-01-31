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

function Map(binding, mapping, silent, buffer)
  create_keymap('', binding, mapping, false, silent, buffer)
end

function Noremap(binding, mapping, silent, buffer)
  create_keymap('', binding, mapping, true, silent, buffer)
end

function Nmap(binding, mapping, silent, buffer)
  create_keymap('n', binding, mapping, false, silent, buffer)
end

function Nnoremap(binding, mapping, silent, buffer)
  create_keymap('n', binding, mapping, true, silent, buffer)
end

function Vmap(binding, mapping, silent, buffer)
  create_keymap('v', binding, mapping, false, silent, buffer)
end

function Vnoremap(binding, mapping, silent, buffer)
  create_keymap('v', binding, mapping, true, silent, buffer)
end

function Omap(binding, mapping, silent, buffer)
  create_keymap('o', binding, mapping, false, silent, buffer)
end

function Onoremap(binding, mapping, silent, buffer)
  create_keymap('o', binding, mapping, true, silent, buffer)
end

function Xmap(binding, mapping, silent, buffer)
  create_keymap('x', binding, mapping, false, silent, buffer)
end

function Xnoremap(binding, mapping, silent, buffer)
  create_keymap('x', binding, mapping, true, silent, buffer)
end

function Imap(binding, mapping, silent, buffer)
  create_keymap('i', binding, mapping, false, silent, buffer)
end

function Inoremap(binding, mapping, silent, buffer)
  create_keymap('i', binding, mapping, true, silent, buffer)
end

function Tmap(binding, mapping, silent, buffer)
  create_keymap('t', binding, mapping, false, silent, buffer)
end

function Tnoremap(binding, mapping, silent, buffer)
  create_keymap('t', binding, mapping, true, silent, buffer)
end
