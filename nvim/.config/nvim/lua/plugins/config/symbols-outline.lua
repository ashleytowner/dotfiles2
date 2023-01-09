require('symbols-outline').setup({
	symbols = {
		Array = { icon = "", hl = "@constant" },
		Boolean = { icon = "⊨", hl = "@boolean" },
		Class = { icon = "ﴯ", hl = "@type" },
		Constant = { icon = "", hl = "@constant" },
		Constructor = { icon = "", hl = "@constructor" },
		Enum = { icon = "", hl = "@type" },
		EnumMember = { icon = "", hl = "@field" },
		Event = { icon = "", hl = "@type" },
		Field = { icon = "ﰠ", hl = "@field" },
		File = { icon = "", hl = "@text.uri" },
		Function = { icon = "", hl = "@function" },
		Interface = { icon = "ﰮ", hl = "@type" },
		Key = { icon = "🔐", hl = "@type" },
		Method = { icon = "", hl = "@method" },
		Module = { icon = "", hl = "@namespace" },
		Namespace = { icon = "", hl = "@namespace" },
		Null = { icon = "NULL", hl = "@type" },
		Number = { icon = "", hl = "@number" },
		Object = { icon = "⦿", hl = "@type" },
		Operator = { icon = "", hl = "@operator" },
		Package = { icon = "", hl = "@namespace" },
		Property = { icon = "ﰠ", hl = "@method" },
		String = { icon = "", hl = "@string" },
		Struct = { icon = "𝓢", hl = "@type" },
		TypeParameter = { icon = "𝙏", hl = "@parameter" },
		Variable = { icon = "", hl = "@constant" },
	}
});

vim.keymap.set(
	'n',
	']]',
	function() vim.cmd('SymbolsOutline') end,
	{ noremap = true }
)
