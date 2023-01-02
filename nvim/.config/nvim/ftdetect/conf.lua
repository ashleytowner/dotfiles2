-- " If a hidden file ends with rc or ignore, it's probably a config file

local filename = vim.fn.expand('%:t')
if string.match(filename, '^%.%a+rc$') or string.match(filename, '^%.%a+ignore$') then
	vim.o.filetype = 'conf'
end
