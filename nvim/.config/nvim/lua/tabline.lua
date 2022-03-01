vim.cmd([[
function! MyTabLine()
  let tablineValue = ''
  " loop through each tab page
  for tab in range(tabpagenr('$'))
    if tab + 1 == tabpagenr()
      let tablineValue .= '%#TabLineSelFill#▎'
    else
      let tablineValue .= '%#TabLine#▎'
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
      if buffername == ''
          if buffertype ==? 'nofile'
              let buffername = '[Scratch]'
          elseif buffertype ==? 'prompt'
              let buffername = ''
          else
              let buffername = '[No Name]'
          endif
      endif
      let icon = ''
      if strlen(buffername) > 0
        let icon = v:lua.require('util').get_file_icon(buffername, fnamemodify(buffername, ':e'))
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
