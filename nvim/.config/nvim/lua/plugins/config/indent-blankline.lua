local indentOk, indent = pcall(require, 'indent_blankline')

if not indentOk then
	print('indent-blankline.nvim is not installed')
end

indent.setup({
	show_current_context = true,
	show_current_context_start = false,
	use_treesitter_scope = false,
	use_treesitter = true,
	show_trailing_blankline_indent = false,
	disable_with_nolist = true,
	show_foldtext = true,
	enabled = true,
	char = "▎",
	show_current_context_start_on_current_line = true
})
