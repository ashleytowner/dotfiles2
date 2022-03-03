local u = require('util')

local function is_window_focused()
  return vim.g.statusline_winid == vim.fn.win_getid(vim.fn.winnr())
end

local function buffer_icon()
  local buffernum = vim.fn.winbufnr(vim.g.statusline_winid)
  local iconData = u.get_file_icon(vim.fn.expand('#' .. buffernum .. ':t'))

  if not iconData.icon then
    return ''
  end

  local bg = u.get_color('StatusLine', 'bg')
  u.create_highlight_group('User1', iconData.color, bg)
  return u.ternary(is_window_focused(), '%#User1#', '%*') .. iconData.icon .. '%*'
end

local function buffer_label()
  local fg = u.get_color('Constant', 'fg')
  local bg = u.get_color('StatusLine', 'bg')
  u.create_highlight_group('User2', fg, bg)
  return u.ternary(is_window_focused(), '%#User2#', '%*') .. ' ﬘%* %n %q '
end

local function git_branch()
  local fg = u.get_color('Label', 'fg')
  local bg = u.get_color('StatusLine', 'bg')
  u.create_highlight_group('User3', fg, bg)
  local branch = u.trim(u.system('git branch --show-current 2> /dev/null'))
  local commit = u.trim(u.system('git rev-parse --short HEAD 2> /dev/null'))
  if (branch == '' and commit == '') then
    return ''
  elseif (branch ~= '') then
    return u.ternary(is_window_focused(), '%#User3#', '%*') .. ' %* ' .. branch .. ' '
  else
    return u.ternary(is_window_focused(), '%#User3#', '%*') .. ' ﰖ%* ' .. commit .. ' '
  end
end

function StatusLine()
  local bufnum = vim.fn.winbufnr(vim.g.statusline_winid);
  local buftype = vim.api.nvim_buf_get_option(bufnum, 'buftype')

  if buftype == 'nofile' then
    return ' %t%=%(%P%)'
  end

  return buffer_label() .. buffer_icon() .. ' %t %m%r' .. git_branch() .. '%= %<%-6.(%l:%c%) %-4.(%P%)'
end
