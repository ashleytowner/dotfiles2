local indentOk, indent = pcall(require, 'indent_blankline')

if not indentOk then
  print('indent-blankline.nvim is not installed')
end

indent.setup({
  show_current_context = true,
  use_treesitter_scope = true,
  use_treesitter = true,
  show_trailing_blankline_indent = false,
  disable_with_nolist = true
})
