require('util.map')

vim.cmd([[
function! ToggleNerdTree()
    if g:NERDTree.IsOpen()
        NERDTreeToggle
    else
        if @% == ""
            NERDTreeToggle
        else
            NERDTreeFind
            norm zz
        endif
    endif
endfunction
]])

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrowCollapsible = '-'
vim.g.NERDTreeDirArrowExpandable = '+'

nmap('<leader><leader>', '<cmd>call ToggleNerdTree()<cr>')
