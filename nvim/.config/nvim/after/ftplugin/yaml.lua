local function yaml_value(parameter)
	local filename = vim.fn.expand('%');
	vim.cmd('!yq \'' .. parameter .. '\' < ' .. filename)
end

local yaml_value_group = vim.api.nvim_create_augroup(
	'YamlValueCommand',
	{ clear = true }
);

vim.api.nvim_create_autocmd({'BufLeave'}, {
	pattern = {'*.yaml', '*.yml'},
	group = yaml_value_group,
	callback = function()
		pcall(vim.api.nvim_del_user_command, 'YamlValue');
	end
});

vim.api.nvim_create_autocmd({'BufEnter'}, {
	pattern = {'*.yaml', '*.yml'},
	group = yaml_value_group,
	callback = function()
		pcall(vim.api.nvim_create_user_command, 'JsonValue', function(input)
			yaml_value(input.args)
		end, { nargs = 1 });
	end
});
