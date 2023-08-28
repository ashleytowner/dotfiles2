local tablib = require('tabline')
function BufferLine()
	local buf_count = vim.fn.bufnr('$')
	local str = ''
	for bufnr = 1, buf_count do
		if vim.fn.buflisted(bufnr) == 1 then
			local is_selected = vim.fn.bufnr() == bufnr
			str = str
				.. tablib.getTabStart(is_selected)
				.. bufnr
				.. ' '
				.. tablib.getFormattedBufferName(bufnr, is_selected, false)
		end
	end
	return str
end
