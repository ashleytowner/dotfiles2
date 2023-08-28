function FoldText()
	return ' ' .. vim.fn.getline(vim.v.foldstart) .. ' (' .. (vim.v.foldend - vim.v.foldstart) .. ' lines)'
end
