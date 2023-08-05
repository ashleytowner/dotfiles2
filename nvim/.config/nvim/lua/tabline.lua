local util = require('util')

local function getClickable(tabnr)
	return '%' .. (tabnr + 1) .. 'T'
end

local function getBaseHighlight(selected)
	return selected and '%#TabLineFill#' or '%#TabLine#'
end

local function getTabStart(selected)
	local highlight = selected and '%#User4#' or getBaseHighlight(selected)
	return highlight .. '▎' .. (selected and getBaseHighlight(selected) or '')
end

local function getFormattedBufferName(bufnr, selected, short)
	local buffertype = vim.fn.getbufvar(bufnr, '&buftype')

	local filetype = vim.fn.getbufvar(bufnr, '&ft')

	if
		buffertype ~= ''
		and buffertype ~= 'help'
		and filetype ~= 'dashboard'
	then
		return ''
	end

	if filetype == 'dashboard' then
		return '  Dashboard'
	end

	local path = vim.fn.bufname(bufnr)
	local longname = vim.fn.fnamemodify(path, ':t')
	local shortname = vim.fn.fnamemodify(path, ':t:r')
	local displayname = (longname == '' and '[No Name]')
		or (short and shortname or longname)
	local icon = util.get_file_icon(longname)

	return (selected and '%#' .. icon.highlight .. '#' or '')
		.. icon.icon
		.. ' '
		.. getBaseHighlight(selected)
		.. displayname
		.. ' '
end

local function getTabBuffers(tabnr, selected, short)
	local buflist = vim.fn.tabpagebuflist(tabnr)
	local list = ''
	for _, bufnr in ipairs(buflist) do
		list = list .. getFormattedBufferName(bufnr, selected, short)
	end
	return list
end

local function generateTabName(tabnr, selected, short)
	return getTabStart(selected)
		.. getClickable(tabnr)
		.. getTabBuffers(tabnr, selected, short)
end

function TabLine()
	util.create_highlight_group(
		'User4',
		util.get_color('TabLineSel', 'bg'),
		util.get_color('TabLineFill', 'bg')
	)
	local tabCount = vim.fn.tabpagenr('$')
	local shortnames = tabCount > 3
	local tabline = ''
	for tabnr = 1, tabCount do
		local selected = tabnr == vim.fn.tabpagenr()
		tabline = tabline .. generateTabName(tabnr, selected, shortnames)
	end
	return tabline
end
