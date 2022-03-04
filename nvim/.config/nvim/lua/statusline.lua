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

local function git_status()
  local cmd_output = u.system('git status -sb 2> /dev/null')

  local ahead = string.match(cmd_output, 'ahead (%d+)')
  local behind = string.match(cmd_output, 'behind (%d+)')

  local git_status = ''

  if behind ~= nil then
    git_status = git_status .. ' ⇣' .. behind
  end

  if ahead ~= nil then
    git_status = git_status .. ' ⇡' .. ahead
  end

  local unstaged = 0
  for _ in string.gmatch(cmd_output, '\n M ') do
    unstaged = unstaged + 1
  end

  local untracked = 0
  for _ in string.gmatch(cmd_output, '\n?? ') do
    untracked = untracked + 1
  end

  if unstaged then
    git_status = git_status .. ' !' .. unstaged
  end

  if untracked then
    git_status = git_status .. ' ?' .. untracked
  end

  return u.trim(git_status)
end

local function git_branch()
  local fg = u.get_color('Label', 'fg')
  local bg = u.get_color('StatusLine', 'bg')
  u.create_highlight_group('User3', fg, bg)

  local branch = u.trim(u.system('git branch --show-current 2> /dev/null'))
  local commit = u.trim(u.system('git rev-parse --short HEAD 2> /dev/null'))
  if (branch == '' and commit == '') then
    return ''
  end
  return u.ternary(branch ~= '', '', 'ﰖ') .. '%* ' .. branch
end

local function git_info()
  return ' ' .. u.ternary(is_window_focused(), '%#User3#', '%*') .. git_branch() .. ' ' .. git_status()
end

local function buffer_info()
  return '%*' .. buffer_label() .. buffer_icon() .. ' %t %m%r'
end

local function position_info()
  return '%= %<%-6.(%l:%c%) %-4.(%P%)'
end

function StatusLine()
  local bufnum = vim.fn.winbufnr(vim.g.statusline_winid);
  local buftype = vim.api.nvim_buf_get_option(bufnum, 'buftype')

  if buftype == 'nofile' then
    return ' %t%=%(%P%)'
  end

  return buffer_info() .. git_info() .. position_info()
end
