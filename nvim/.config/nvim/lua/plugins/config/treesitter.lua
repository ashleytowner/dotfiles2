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

local ts_utils = require('nvim-treesitter.ts_utils')

local function get_node(main)
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

local function select_node(node)
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

local function get_parent_node_of_type(types)
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
	select_node(get_parent_node_of_type({ 'function_declaration', 'block' }))
end, { noremap = true, silent = true })

vim.keymap.set({ 'o', 'x' }, 'ix', function()
	select_node(get_node(false))
end, { noremap = true, silent = true })

local function toggle_check()
	local list_item = get_parent_node_of_type({ 'list_item' })
	for node in list_item:iter_children() do
		if
			node:type() == 'task_list_marker_unchecked'
			or node:type() == 'task_list_marker_checked'
		then
			local current_position = vim.api.nvim_win_get_cursor(0)
			ts_utils.goto_node(node)
			if node:type() == 'task_list_marker_checked' then
				vim.cmd('norm lr ')
			else
				vim.cmd('norm lrx')
			end
			vim.api.nvim_win_set_cursor(0, current_position)
		end
	end
end

local md_group = vim.api.nvim_create_augroup('Markdown', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead' }, {
	pattern = '*.md',
	callback = function()
		vim.keymap.set({ 'n' }, '<leader>x', function()
			toggle_check()
		end, { noremap = true, buffer = true, silent = true })
	end,
	group = md_group,
})
