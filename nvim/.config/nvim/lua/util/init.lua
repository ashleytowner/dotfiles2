require('util.objects')

local M = {}

---Trim a string
---@param s string the string to trim
---@return string
function M.trim(s)
	return (s:gsub('^%s*(.-)%s*$', '%1'))
end

---Get the length of a table
---@param tbl table
---@return number
function M.get_table_len(tbl)
	local count = 0
	for _ in pairs(tbl) do
		count = count + 1
	end
	return count
end

---Run a system command
---@param cmd string
---@return string|nil "the result of the command"
function M.system(cmd)
	local handle = io.popen(cmd)
	if handle == nil then
		return nil
	end
	local result = handle:read('*a')
	handle:close()
	return result
end

---Get the color of a highlight group
---@param group string
---@param attr string
---@return string|nil
function M.get_color(group, attr)
	local color = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
	return color or nil
end

---Ternary operator
---@param condition boolean
---@param aval any
---@param bval any
---@return any "Either aval or bval"
function M.ternary(condition, aval, bval)
	if condition then
		return aval
	else
		return bval
	end
end

---Get the icon and color for a filetype based on the file extension
---@param filename string
---@return {icon: string, color: string, highlight: string}
function M.get_file_icon(filename)
	local extension = vim.fn.fnamemodify(filename, ':e')
	if extension == '' then
		extension = filename
	end
	local deviconsOk, devicons = pcall(require, 'nvim-web-devicons')
	if not deviconsOk then
		return {
			icon = '?',
			color = '#FFFFFF',
			highlight = '',
		}
	end
	local icon, color =
		devicons.get_icon_color(filename, extension, { default = true })
	local _, highlight = require('nvim-web-devicons').get_icon(
		filename,
		extension,
		{ default = true }
	)
	return {
		icon = icon,
		color = color,
		highlight = highlight,
	}
end

---Get the hash at the HEAD of a github repository
---@param plugin string the name of the repository, as in github-username/repo
---@return string|nil "the hash of the HEAD"
function M.get_plugin_hash(plugin)
	return M.system(
		'git ls-remote https://github.com/'
			.. plugin
			.. ".git HEAD | awk '{ print $1 }'"
	)
end

---Yank a string to the " register
---@param text string the text to yank
---@return nil
function M.yank(text)
	vim.fn.setreg('"', text)
end

---Create a highlight group
---@param group string the name of the group to create
---@param fg string the foreground (text) color
---@param bg string the background color
function M.create_highlight_group(group, fg, bg)
	if fg == nil or fg == '' or bg == nil or bg == '' then
		return
	end
	vim.cmd('hi ' .. group .. ' guifg=' .. fg .. ' guibg=' .. bg)
end

---Get the visually selected text in the current buffer
---@return string
function M.get_visual_selection()
	local select_start = vim.api.nvim_buf_get_mark(0, '<')
	local select_end = vim.api.nvim_buf_get_mark(0, '>')

	-- Line-wise visual selection can go over the length of the last line
	-- we are preventing that here
	local last_line =
		vim.api.nvim_buf_get_lines(0, select_end[1] - 1, select_end[1], true)[1]

	if select_end[2] > string.len(last_line) then
		select_end[2] = string.len(last_line)
	end

	local text = vim.api.nvim_buf_get_text(
		0,
		select_start[1] - 1,
		select_start[2],
		select_end[1] - 1,
		select_end[2] + 1,
		{}
	)

	return text
end

---Get a list of open buffers
---@return { name: string, number: number }[]
function M.get_buffers()
	local buffers = {}

	for buffer = 1, vim.fn.bufnr('$') do
		local is_listed = vim.fn.buflisted(buffer)
		if is_listed == 1 then
			local bufname = vim.fn.bufname(buffer)
			table.insert(buffers, {
				number = buffer,
				name = bufname,
			})
		end
	end

	return buffers
end

---Get a list of open windows
---@return number[]
function M.get_windows()
	local windows = {}

	for window = 1, vim.fn.winnr('$') do
		table.insert(windows, vim.fn.win_getid(window))
	end

	return windows
end

return M
