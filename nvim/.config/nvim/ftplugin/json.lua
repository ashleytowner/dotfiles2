local function json_value(parameter)
	local filename = vim.fn.expand('%');
	vim.cmd('!jq \'' .. parameter .. '\' < ' .. filename)
end

local json_value_group = vim.api.nvim_create_augroup(
	'JsonValueCommand',
	{ clear = true }
);

vim.api.nvim_create_autocmd({'BufLeave'}, {
	pattern = {"*.json"},
	group = json_value_group,
	callback = function()
		pcall(vim.api.nvim_del_user_command, 'JsonValue');
	end
});

vim.api.nvim_create_autocmd({'BufEnter'}, {
	pattern = {"*.json"},
	group = json_value_group,
	callback = function()
		pcall(vim.api.nvim_create_user_command, 'JsonValue', function(input)
			json_value(input.args)
		end, { nargs = 1 });
	end
});
