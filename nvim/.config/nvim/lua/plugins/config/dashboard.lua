local version = require('util').trim(require('util').system('nvim --version | grep -o "v[0-9]\\+\\.[0-9]\\+\\.[0-9]"'))
require('dashboard').setup({
	theme = 'doom',
	config = {
		header = {
			" _   _         __     ___           ",
			"| \\ | | ___  __\\ \\   / (_)_ __ ___  ",
			"|  \\| |/ _ \\/ _ \\ \\ / /| | '_ ` _ \\ ",
			"| |\\  |  __/ (_) \\ V / | | | | | | |",
			"|_| \\_|\\___|\\___/ \\_/  |_|_| |_| |_|",
			''
		},
		footer = { version },
		center = {
			{
				icon = '  ',
				desc = 'Find File',
				action = 'Telescope find_files',
				shortcut = '<C-p>',
				key = '<C-p>',
				icon_hl = 'Special',
				key_hl = 'Special'
			},
			{
				icon = '  ',
				desc = 'Browse Files',
				action = 'NvimTreeToggle',
				shortcut = '<leader><leader>',
				key = '<leader><leader>',
				icon_hl = 'Special',
				key_hl = 'Special'
			},
			{
				icon = '  ',
				desc = 'Live Grep',
				action = 'Telescope live_grep',
				shortcut = '<C-f>',
				key = '<C-f>',
				icon_hl = 'Special',
				key_hl = 'Special'
			},
			{
				icon = '  ',
				desc = 'Startup Time',
				action = 'StartupTime --tries 50',
				shortcut = ':StartupTime',
				key = ':StartupTime',
				icon_hl = 'Special',
				key_hl = 'Special'
			},
			{
				icon = '  ',
				desc = 'Change Colorscheme',
				action = 'Telescope colorscheme',
				shortcut = '<leader>tc',
				key = '<leader>tc',
				icon_hl = 'Special',
				key_hl = 'Special'
			},
			{
				icon = '  ',
				desc = 'Check Health',
				action = 'CheckHealth',
				shortcut = ':CheckHealth',
				key = ':CheckHealth',
				icon_hl = 'Special',
				key_hl = 'Special'
			},
			{
				icon = '  ',
				desc = 'Open Dotfiles',
				action = 'e ~/dotfiles',
				shortcut = ':e ~/dotfiles',
				key = ':e ~/dotfiles',
				icon_hl = 'Special',
				key_hl = 'Special'
			},
		}
	}
})
