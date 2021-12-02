local P = {}

function P.spread(template)
  local result = {}
  for key, value in pairs(template) do
    result[key] = value
  end

  return function(table)
    for key, value in pairs(table) do
      result[key] = value
    end
    return result
  end
end

vim.cmd([[
function! GitBranch()
  let branch = trim(system('git branch --show-current 2> /dev/null'))
  if (branch == '')
    return ""
  else
    " return "|  " . branch
    return "  " . branch . " "
  endif
endfunction
]])

return P
