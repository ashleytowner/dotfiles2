require('util.map')
require('util.objects')
require('util.spread')

local M = {}


function M.trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function M.system(cmd)
  local handle = io.popen(cmd)
  local result = handle:read('*a')
  handle:close()
  return result
end


function M.get_color(group, attr)
    return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
end

function M.ternary(condition, aval, bval)
  if condition then
    return aval
  else
    return bval
  end
end

function M.get_file_icon(filename)
  local extension = vim.fn.fnamemodify(filename, ':e')
  local icon, color = require('nvim-web-devicons')
    .get_icon_color(filename, extension, { default = true })
  return {
    icon = icon,
    color = color
  }
end

function M.create_highlight_group(group, fg, bg)
  vim.cmd('hi ' .. group .. ' guifg=' .. fg .. ' guibg=' .. bg)
end

return M
