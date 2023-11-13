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
		'rust',
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

local M = {}

local ts_utils = require('nvim-treesitter.ts_utils')

function M.get_node(main)
	local node = ts_utils.get_node_at_cursor()

	if node == nil then
		error('Could not find node')
	end

	if main then
		local start_row = node:start()
		local parent = node:parent()
		local root = ts_utils.get_root_for_node(node)

		while
			parent ~= nil
			and parent:start() == start_row
			and parent ~= root
		do
			node = parent
			parent = node:parent()
		end
	end

	return node
end

function M.select_node(node)
	if node == nil then
		return
	end
	local bufnr = vim.fn.bufnr()
	ts_utils.update_selection(bufnr, node)
end

local function is_in_table(table, value)
	for _, v in pairs(table) do
		if v == value then
			return true
		end
	end
	return false
end

function M.get_parent_node_of_type(types)
	local node = ts_utils.get_node_at_cursor()

	if node == nil then
		error('Node is nil')
	end

	if types == nil then
		error('Types is nil')
	end

	local parent = node:parent()

	while parent ~= nil and not is_in_table(types, node:type()) do
		node = parent
		parent = node:parent()
	end

	if is_in_table(types, node:type()) then
		return node
	end
end

vim.keymap.set({ 'o', 'x' }, 'ax', function()
	M.select_node(
		M.get_parent_node_of_type({ 'function_declaration', 'block', 'list' })
	)
end, { noremap = true, silent = true })

vim.keymap.set({ 'o', 'x' }, 'ix', function()
	M.select_node(M.get_node(false))
end, { noremap = true, silent = true })

return M
