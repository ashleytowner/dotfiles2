vim.g.lightline = {
	colorscheme = 'material',
	active = {
		left = {
			{ 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename' }
		},
		right = {
			{ 'percent' },
			{ 'lineinfo' },
			{ 'fineencoding', 'filetype' }
		},
	},
	component_function = {
		gitbranch = 'FugitiveHead',
		filename = 'LightlineFilename'
	}
}

vim.api.nvim_exec([[
function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let modified = &modified ? ' +' : ''
	return filename . modified
endfunction
]], false)
