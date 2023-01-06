local function json_value(parameter)
	local filename = vim.fn.expand('%');
	vim.cmd('!jq \'' .. parameter .. '\' < ' .. filename)
end

vim.api.nvim_create_user_command('JsonValue', function(input)
	json_value(input.args)
end, { nargs=1 });
