local commentOk, comment = pcall(require, 'Comment')

if not commentOk then
	print('Comment.nvim is not installed')
end

comment.setup({})
