local indentOk, indent = pcall(require, 'indent_blankline')

if not indentOk then
  print('indent-blankline.nvim is not installed')
end

indent.setup({
  show_current_context = true
})
