local u = require('util')

local function is_window_focused()
  return vim.g.statusline_winid == vim.fn.win_getid(vim.fn.winnr())
end

local function create_highlight_group(group, fg, bg)
  vim.cmd('hi ' .. group .. ' guifg=' .. fg .. ' guibg=' .. bg)
end


local function buffer_icon()
  local buffernum = vim.fn.winbufnr(vim.g.statusline_winid)
  local icon, fg = require('nvim-web-devicons')
    .get_icon_color(
      vim.fn.expand('#'.. buffernum .. ':t'),
      vim.fn.expand('#' .. buffernum .. ':e'),
      { default = true }
    )

  local bg = u.get_color('StatusLine', 'bg')
  create_highlight_group('User1', fg, bg)
  return u.ternary(is_window_focused(), '%#User1#', '%*') .. icon .. '%*'
end

local function buffer_label()
  local fg = u.get_color('Constant', 'fg')
  local bg = u.get_color('StatusLine', 'bg')
  create_highlight_group('User2', fg, bg)
  return u.ternary(is_window_focused(), '%#User2#', '%*') .. ' ﬘%* %n %q '
end

local function git_branch()
  local fg = u.get_color('Label', 'fg')
  local bg = u.get_color('StatusLine', 'bg')
  create_highlight_group('User3', fg, bg)
  local branch = u.trim(u.system('git branch --show-current 2> /dev/null'))
  if (branch == '') then
    return ''
  else
    return u.ternary(is_window_focused(), '%#User3#', '%*') .. ' %* ' .. branch .. ' '
  end
end

function StatusLine()
  return buffer_label() .. buffer_icon() .. ' %t %m%r' .. git_branch() .. '%= %<%-6.(%l:%c%) %-4.(%P%)'
end
