require('util.objects')

local M = {}

function M.trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end
function M.get_table_len(tbl)
	local count = 0
	for _ in pairs(tbl) do
		count = count + 1
	end
	return count
end

function M.system(cmd)
	local handle = io.popen(cmd)
	if (handle == nil) then
		return nil
	end
	local result = handle:read('*a')
	handle:close()
	return result
end

function M.get_color(group, attr)
	local color = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
	return color or nil
end

function M.ternary(condition, aval, bval)
	if condition then
		return aval
	else
		return bval
	end
end

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
			highlight = ''
		}
	end
	local icon, color = devicons
			.get_icon_color(filename, extension, { default = true })
	local _, highlight = require('nvim-web-devicons').get_icon(filename, extension, { default = true })
	return {
		icon = icon,
		color = color,
		highlight = highlight
	}
end

function M.get_plugin_hash(plugin)
	return M.system('git ls-remote https://github.com/' .. plugin .. '.git HEAD | awk \'{ print $1 }\'')
end

function M.yank(text)
	vim.fn.setreg('"', text)
end

function M.create_highlight_group(group, fg, bg)
	if fg == nil or fg == '' or bg == nil or bg == '' then
		return
	end
	vim.cmd('hi ' .. group .. ' guifg=' .. fg .. ' guibg=' .. bg)
end

function M.get_visual_selection()
	local select_start = vim.api.nvim_buf_get_mark(0, '<');
	local select_end = vim.api.nvim_buf_get_mark(0, '>');


	-- Line-wise visual selection can go over the length of the last line
	-- we are preventing that here
	local last_line = vim.api.nvim_buf_get_lines(
		0,
		select_end[1] - 1,
		select_end[1],
		true
	)[1];

	if select_end[2] > string.len(last_line) then
		select_end[2] = string.len(last_line);
	end

	local text = vim.api.nvim_buf_get_text(
		0,
		select_start[1] - 1,
		select_start[2],
		select_end[1] - 1,
		select_end[2] + 1,
		{}
	);

	return text
end

return M
