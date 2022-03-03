vim.cmd([[
function! MyTabLine()
  let tablineValue = ''
  " loop through each tab page
  for tab in range(tabpagenr('$'))
    let tabHl = '%#TabLine#'
    if tab + 1 == tabpagenr()
      let tabHl = '%#TabLineFill#'
      let tablineValue .= '%#User4#▎' . tabHl
    else
      let tablineValue .= tabHl . '▎'
    endif
    " set the tab page number (for mouse clicks)
    let tablineValue .= '%' . (tab + 1) . 'T '
    " get buffer names and statuses
    let tabname = ''  " temp str for buf names
    let isModified = 0   " &modified counter
    let buflist = tabpagebuflist(tab + 1)
    " loop through each buffer in a tab
    for b in buflist
      let buffername = bufname(b)
      let buffertype = getbufvar(b, "&buftype")
      let bufferlisted = getbufvar(b, "&buflisted")

      let icon = v:lua.require('util').get_file_icon(buffername, fnamemodify(buffername, ':e')).icon

      if !bufferlisted
        continue
      endif

      if buffername == ''
          if buffertype ==? 'nofile'
              let buffername = '[Scratch]'
          else
              let buffername = '[No Name]'
          endif
      endif

      if getbufvar(b, "&modifiable") || buffertype == 'terminal'
        let tabname .= icon . ' ' . fnamemodify(buffername, ':t') . ', '
      endif
      if getbufvar(b, "&modified")
        let isModified += 1
      endif
    endfor
    let tabname = substitute(tabname, ', $', '', '')
    " add buffer names
    let tablineValue .= tabname
    if isModified > 0
      let tablineValue .= ' [+]'
    endif
    " switch to no underlining and add final space
    let tablineValue .= ' %#TabLine# '
  endfor
  let tablineValue .= '%#TabLineFill#%T'
  return tablineValue
endfunction
]])
