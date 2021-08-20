function! ToggleNerdTree()
    if g:NERDTree.IsOpen()
        execute "NERDTreeClose"
    else
        execute "NERDTreeFind"
    endif
endfunction
