local function yaml_value(parameter)
	local filename = vim.fn.expand('%');
	vim.cmd('!yq \'' .. parameter .. '\' < ' .. filename)
end

vim.api.nvim_create_user_command('YamlValue', function(input)
	yaml_value(input.args)
end, { nargs=1 });
