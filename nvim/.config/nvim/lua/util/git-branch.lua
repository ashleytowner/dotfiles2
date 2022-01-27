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
