local util = require('util')

local TabLib = {}

---Get the base highlight for a tab
---@param selected boolean whether the tab is selected
local function getBaseHighlight(selected)
	return selected and '%#TabLineFill#' or '%#TabLine#'
end

---Get the start of a tab
---@param selected boolean whether the tab is selected
function TabLib.getTabStart(selected)
	local highlight = selected and '%#User4#' or getBaseHighlight(selected)
	return highlight .. '▎' .. (selected and getBaseHighlight(selected) or '')
end

---Get the formatted name of a buffer
---@param bufnr number
---@param selected boolean whether the tab is selected
---@param short boolean whether the name should be shortened
function TabLib.getFormattedBufferName(bufnr, selected, short)
	local buffertype = vim.fn.getbufvar(bufnr, '&buftype')

	local filetype = vim.fn.getbufvar(bufnr, '&ft')

	if
		buffertype ~= ''
		and buffertype ~= 'help'
		and filetype ~= 'dashboard'
		and buffertype ~= 'terminal'
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

	return ((selected and bufnr == vim.fn.bufnr()) and '%#' .. icon.highlight .. '#' or '')
		.. icon.icon
		.. ' '
		.. getBaseHighlight(selected)
		.. displayname
		.. ' '
end

---Get the list of buffers in a tab
---@param tabnr number
---@param selected boolean whether the tab is selected
---@param short boolean whether the name should be shortened
local function getTabBuffers(tabnr, selected, short)
	local buflist = vim.fn.tabpagebuflist(tabnr)
	local list = ''
	for _, bufnr in ipairs(buflist) do
		list = list .. TabLib.getFormattedBufferName(bufnr, selected, short)
	end
	return list
end

---Generate the name of a tab
---@param tabnr number
---@param selected boolean whether the tab is selected
---@param short boolean whether the name should be shortened
---@param show_close boolean whether the close button should be shown
local function generateTabName(tabnr, selected, short, show_close)
	return '%' .. tabnr .. 'T' .. TabLib.getTabStart(selected)
		.. getTabBuffers(tabnr, selected, short) .. '%T'
		.. (show_close and ('%' .. tabnr .. 'X󱎘 %X') or '')
end

---Generate the tabline
---@return string
function TabLine()
	util.create_highlight_group(
		'User4',
		util.get_color('TabLineSel', 'bg') or '',
		util.get_color('TabLineFill', 'bg') or ''
	)
	local tabCount = vim.fn.tabpagenr('$')
	local shortnames = tabCount > 3
	local tabline = ''
	local show_close = tabCount > 1 and vim.o.mouse ~= ''
	for tabnr = 1, tabCount do
		local selected = tabnr == vim.fn.tabpagenr()
		tabline = tabline .. generateTabName(tabnr, selected, shortnames, show_close)
	end
	return tabline
end

return TabLib
