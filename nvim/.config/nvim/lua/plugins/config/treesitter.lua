local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.typescript.filetype_to_parsername = 'javascript.jsx'

require('nvim-treesitter.configs').setup({
	-- ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		'javascript',
		'typescript',
		'c',
		'cpp',
		'gitcommit',
		'lua',
		'yaml',
		'json',
		'toml',
		'markdown',
		'rust'
	},
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gnn',
			node_incremental = 'grn',
			scope_incremental = 'grc',
			node_decremental = 'grm',
		},
	},
	indent = {
		enable = true,
	},
})
