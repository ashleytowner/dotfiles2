local ensure_packer = function()
	local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			install_path
		})
		vim.cmd('packadd packer.nvim')
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local commits = {
	['Exafunction/codeium.vim'] = '7ee2e1eca24ccfe755f56506118d91abba414233',
	['ThePrimeagen/refactoring.nvim'] = '47a1716a9020c0093a1c8af36c3f9434dae62bbd',
	['akinsho/toggleterm.nvim'] = '68fdf851c2b7901a7065ff129b77d3483419ddce',
	['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
	['catppuccin/nvim'] = '57b421ee5f7380f816791fa451e86f213b625ece',
	['dracula/vim'] = 'eb577d47b0cfc9191bf04c414b4042d5f1a980f8',
	['dstein64/vim-startuptime'] = '01b67169c3ebe41f163c07bf6853555ca19bc27f',
	['folke/tokyonight.nvim'] = 'df13e3268a44f142999fa166572fe95a650a0b37',
	['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'de02085d6af1633942549a238bc7a5524fa9b201',
	['github/copilot.vim'] = '1358e8e45ecedc53daf971924a0541ddf6224faf',
	['glacambre/firenvim'] = '386239e1b1e6e3884db4da8bb7057709bec3dc51',
	['gpanders/editorconfig.nvim'] = '5b9e303e1d6f7abfe616ce4cc8d3fffc554790bf',
	['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
	['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
	['hrsh7th/cmp-calc'] = '50792f34a628ea6eb31d2c90e8df174671e4e7a0',
	['hrsh7th/cmp-cmdline'] = '5af1bb7d722ef8a96658f01d6eb219c4cf746b32',
	['hrsh7th/cmp-nvim-lsp'] = '0e6b2ed705ddcff9738ec4ea838141654f12eeef',
	['hrsh7th/cmp-path'] = '91ff86cd9c29299a64f968ebb45846c485725f23',
	['hrsh7th/cmp-vsnip'] = '989a8a73c44e926199bfd05fa7a516d51f2d2752',
	['hrsh7th/nvim-cmp'] = '3ac8d6cd29c74ff482d8ea47d45e5081bfc3f5ad',
	['hrsh7th/vim-vsnip'] = '7753ba9c10429c29d25abfd11b4c60b76718c438',
	['jay-babu/mason-nvim-dap.nvim'] = 'c836e511e796d2b6a25ad9f164f5b25d8b9ff705',
	['jayp0521/mason-null-ls.nvim'] = '54d702020bf94e4eefd357f0b738317af30217eb',
	['jose-elias-alvarez/null-ls.nvim'] = '77e53bc3bac34cc273be8ed9eb9ab78bcf67fa48',
	['kiyoon/treesitter-indent-object.nvim'] = '50c2301c3b3785430df77856be59dc9fec7347d8',
	['kyazdani42/nvim-tree.lua'] = '736c7ff59065275f0483af4b7f07a9bc41449ad0',
	['kyazdani42/nvim-web-devicons'] = '986875b7364095d6535e28bd4aac3a9357e91bbe',
	['lewis6991/gitsigns.nvim'] = '814158f6c4b1724c039fcefe79b0be72c9131c2d',
	['lukas-reineke/indent-blankline.nvim'] = '018bd04d80c9a73d399c1061fa0c3b14a7614399',
	['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
	['mbbill/undotree'] = '485f01efde4e22cb1ce547b9e8c9238f36566f21',
	['mfussenegger/nvim-dap'] = '56118cee6af15cb9ddba9d080880949d8eeb0c9f',
	['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
	['neovim/nvim-lspconfig'] = '8dc45a5c142f0b5a5dd34e5cdba33217d5dc6a86',
	['numToStr/Comment.nvim'] = 'e1fe53117aab24c378d5e6deaad786789c360123',
	['nvim-lua/plenary.nvim'] = '9ac3e9541bbabd9d73663d757e4fe48a675bb054',
	['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
	['nvim-telescope/telescope.nvim'] = '40c31fdde93bcd85aeb3447bb3e2a3208395a868',
	['nvim-treesitter/nvim-treesitter'] = '102f1b2f55575f0a2f18be92eafc0e7142024ad1',
	['nvim-treesitter/playground'] = '2b81a018a49f8e476341dfcb228b7b808baba68b',
	['onsails/lspkind-nvim'] = '57610d5ab560c073c465d6faf0c19f200cb67e6e',
	['phaazon/hop.nvim'] = '03f0434869f1f38868618198b5f4f2ab6d39aef2',
	['rafamadriz/friendly-snippets'] = '1d0dac346de7c6895ac72528df3276386c6b149b',
	['simrat39/symbols-outline.nvim'] = '512791925d57a61c545bc303356e8a8f7869763c',
	['tpope/vim-fugitive'] = '5f0d280b517cacb16f59316659966c7ca5e2bea2',
	['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
	['tpope/vim-surround'] = '3d188ed2113431cf8dac77be61b842acb64433d9',
	['wbthomason/packer.nvim'] = '1d0cf98a561f7fd654c970c49f917d74fafe1530',
	['williamboman/mason-lspconfig.nvim'] = '90a8bbf106b85b76951a34c542058ffa807de2b1',
	['williamboman/mason.nvim'] = 'e60b855bfa8c7d34387200daa6e54a5e22d3da05',
	['windwp/nvim-autopairs'] = '7747bbae60074acf0b9e3a4c13950be7a2dff444',
}

return require('packer').startup({
	function(use)
		use {
			'wbthomason/packer.nvim',
			commit = commits['wbthomason/packer.nvim']
		}

		use {
			'nvim-lua/plenary.nvim',
			commit = commits['nvim-lua/plenary.nvim']
		}

		use {
			'williamboman/mason.nvim',
			commit = commits['williamboman/mason.nvim'],
			config = function() require('plugins.config.mason') end,
		}

		use {
			'jay-babu/mason-nvim-dap.nvim',
			requires = {
				{ 'mfussenegger/nvim-dap' },
				{ 'williamboman/mason.nvim' },
			},
			commit = commits['jay-babu/mason-nvim-dap.nvim'],
			config = function() require('plugins.config.dap') end,
		}

		use {
			'mfussenegger/nvim-dap',
			commit = commits['mfussenegger/nvim-dap'],
		}

		use {
			'ThePrimeagen/refactoring.nvim',
			commit = commits['ThePrimeagen/refactoring.nvim'],
			config = function() require('plugins.config.refactoring') end,
			requires = {
				{ 'nvim-lua/plenary.nvim' },
				{ 'nvim-treesitter/nvim-treesitter' }
			},
		}

		-- AI

		-- use {
		-- 	'github/copilot.vim',
		-- 	commit = commits['github/copilot.vim'],
		-- 	config = function() require('plugins.config.copilot') end,
		-- 	disable = true
		-- }

		-- use {
		-- 	'Exafunction/codeium.vim',
		-- 	commit = commits['Exafunction/codeium.vim'],
		-- 	config = function() require('plugins.config.codeium') end,
		-- 	-- disable = true
		-- }

		-- Util

		-- use {
		-- 	'dstein64/vim-startuptime',
		-- 	commit = commits['dstein64/vim-startuptime'],
		-- 	cmd = 'StartupTime',
		-- }

		-- use {
		-- 	'akinsho/toggleterm.nvim',
		-- 	commit = commits['akinsho/toggleterm.nvim'],
		-- 	config = function() require('plugins.config.toggleterm') end,
		-- }

		-- use {
		-- 	'glacambre/firenvim',
		-- 	commit = commits['glacambre/firenvim'],
		-- 	run = function() vim.fn['firenvim#install'](0) end,
		-- 	config = function() require('plugins.config.firenvim') end,
		-- 	cond = function() return vim.g.started_by_firenvim end,
		-- }


		-- Motions & Objects

		use {
			'tpope/vim-surround',
			commit = commits['tpope/vim-surround'],
			config = function() require('plugins.config.vimSurround') end,
			requires = {
				'tpope/vim-repeat',
				commit = commits['tpope/vim-repeat']
			}
		}

		use {
			'numToStr/Comment.nvim',
			commit = commits['numToStr/Comment.nvim'],
			config = function() require('plugins.config.Comment') end,
		}

		use {
			'bkad/CamelCaseMotion',
			commit = commits['bkad/CamelCaseMotion'],
			config = function() require('plugins.config.camelCaseMotions') end,
		}

		use {
			'phaazon/hop.nvim',
			commit = commits['phaazon/hop.nvim'],
			config = function() require('plugins.config.hop') end,
		}

		use {
			'windwp/nvim-autopairs',
			commit = commits['windwp/nvim-autopairs'],
			config = function() require('plugins.config.autopairs') end,
			after = {
				'nvim-cmp'
			},
			disable = true
		}

		use {
			'mattn/emmet-vim',
			commit = commits['mattn/emmet-vim']
		}

		-- Git

		use {
			'lewis6991/gitsigns.nvim',
			commit = commits['lewis6991/gitsigns.nvim'],
			config = function() require('plugins.config.gitsigns') end,
			requires = {
				'nvim-lua/plenary.nvim',
				commit = commits['nvim-lua/plenary.nvim']
			},
		}

		use {
			'tpope/vim-fugitive',
			commit = commits['tpope/vim-fugitive'],
			config = function() require('plugins.config.fugitive') end,
			cmd = 'Git',
		}

		-- File Management

		use {
			'nvim-telescope/telescope.nvim',
			commit = commits['nvim-telescope/telescope.nvim'],
			config = function() require('plugins.config.telescope') end,
			requires = {
				{
					'gbrlsnchs/telescope-lsp-handlers.nvim',
					commit = commits['gbrlsnchs/telescope-lsp-handlers.nvim']
				},
				{
					'nvim-lua/plenary.nvim',
					commit = commits['nvim-lua/plenary.nvim']
				},
				{
					'nvim-telescope/telescope-ui-select.nvim',
					commit = commits['nvim-telescope/telescope-ui-select.nvim']
				}
			},
		}

		use {
			'kyazdani42/nvim-tree.lua',
			commit = commits['kyazdani42/nvim-tree.lua'],
			requires = {
				{
					'kyazdani42/nvim-web-devicons',
					commit = commits['kyazdani42/nvim-web-devicons']
				},
			},
			config = function() require('plugins.config.nvimTree') end,
		}

		use {
			'mbbill/undotree',
			commit = commits['mbbill/undotree'],
			config = function() require('plugins.config.undotree') end,
		}

		-- LSP, Completion & Formatting

		-- use {
		-- 	'neovim/nvim-lspconfig',
		-- 	commit = commits['neovim/nvim-lspconfig'],
		-- 	config = function() require('lsp') end,
		-- 	after = { 'mason.nvim' },
		-- 	requires = {
		-- 		{
		-- 			'williamboman/mason-lspconfig.nvim',
		-- 			commit = commits['williamboman/mason-lspconfig.nvim'],
		-- 		}
		-- 	},
		-- }

		-- use {
		-- 	'simrat39/symbols-outline.nvim',
		-- 	commit = commits['simrat39/symbols-outline.nvim'],
		-- 	config = function() require('plugins.config.symbols-outline') end,
		-- }

		-- use {
		-- 	'jose-elias-alvarez/null-ls.nvim',
		-- 	commit = commits['jose-elias-alvarez/null-ls.nvim'],
		-- 	config = function() require('lsp.null-ls') end,
		-- 	after = { 'mason.nvim' },
		-- 	requires = {
		-- 		{
		-- 			'jayp0521/mason-null-ls.nvim',
		-- 			commit = commits['jayp0521/mason-null-ls.nvim']
		-- 		}
		-- 	},
		-- }

		-- use {
		-- 	'hrsh7th/nvim-cmp',
		-- 	commit = commits['hrsh7th/nvim-cmp'],
		-- 	config = function() require('plugins.config.cmp') end,
		-- 	requires = {
		-- 		{
		-- 			'hrsh7th/vim-vsnip',
		-- 			commit = commits['hrsh7th/vim-vsnip'],
		-- 			after = 'nvim-cmp',
		-- 			config = function() require('plugins.config.vsnip') end,
		-- 		},
		-- 		{
		-- 			'hrsh7th/cmp-vsnip',
		-- 			commit = commits['hrsh7th/cmp-vsnip'],
		-- 			after = 'nvim-cmp'
		-- 		},
		-- 		{
		-- 			'rafamadriz/friendly-snippets',
		-- 			commit = commits['rafamadriz/friendly-snippets'],
		-- 			after = 'nvim-cmp',
		-- 		},
		-- 		{
		-- 			'hrsh7th/cmp-buffer',
		-- 			commit = commits['hrsh7th/cmp-buffer'],
		-- 			after = 'nvim-cmp',
		-- 		},
		-- 		{
		-- 			'hrsh7th/cmp-calc',
		-- 			commit = commits['hrsh7th/cmp-calc'],
		-- 			after = 'nvim-cmp',
		-- 		},
		-- 		{
		-- 			'hrsh7th/cmp-cmdline',
		-- 			commit = commits['hrsh7th/cmp-cmdline'],
		-- 			after = 'nvim-cmp',
		-- 		},
		-- 		{
		-- 			'hrsh7th/cmp-nvim-lsp',
		-- 			commit = commits['hrsh7th/cmp-nvim-lsp'],
		-- 			after = 'nvim-cmp',
		-- 		},
		-- 		{
		-- 			'hrsh7th/cmp-path',
		-- 			commit = commits['hrsh7th/cmp-path'],
		-- 			after = 'nvim-cmp',
		-- 		},
		-- 		{
		-- 			'onsails/lspkind-nvim',
		-- 			commit = commits['onsails/lspkind-nvim']
		-- 		}
		-- 	},
		-- }

		-- Syntax Highlighting

		use {
			'nvim-treesitter/nvim-treesitter',
			commit = commits['nvim-treesitter/nvim-treesitter'],
			run = ':TSUpdate',
			config = function() require('plugins.config.treesitter') end,
		}

		use {
			'kiyoon/treesitter-indent-object.nvim',
			config = function()
				-- require('treesitter_indent_object').setup()
				-- select context-aware indent
				vim.keymap.set({ 'x', 'o' }, 'ai',
					'<Cmd>lua require\'treesitter_indent_object.textobj\'.select_indent_outer()<CR>')
				-- ensure selecting entire line (or just use Vai)
				vim.keymap.set({ 'x', 'o' }, 'ai',
					'<Cmd>lua require\'treesitter_indent_object.textobj\'.select_indent_outer(true)<CR>')
				-- select inner block (only if block, only else block, etc.)
				vim.keymap.set({ 'x', 'o' }, 'iI',
					'<Cmd>lua require\'treesitter_indent_object.textobj\'.select_indent_inner()<CR>')
				-- select entire inner range (including if, else, etc.)
				vim.keymap.set({ 'x', 'o' }, 'ii',
					'<Cmd>lua require\'treesitter_indent_object.textobj\'.select_indent_inner(true)<CR>')
			end,
			requires = 'nvim-treesitter/nvim-treesitter',
			after = 'indent-blankline.nvim',
			commit = commits['kiyoon/treesitter-indent-object.nvim'],
		}

		use {
			'nvim-treesitter/playground',
			commit = commits['nvim-treesitter/playground'],
			requires = 'nvim-treesitter/nvim-treesitter',
		}

		use {
			'lukas-reineke/indent-blankline.nvim',
			commit = commits['lukas-reineke/indent-blankline.nvim'],
			config = function() require('plugins.config.indent-blankline') end,
		}

		-- Theming

		use {
			'haishanh/night-owl.vim',
			commit = commits['haishanh/night-owl.vim'],
		}

		use {
			'catppuccin/nvim',
			commit = commits['catppuccin/nvim'],
			as = 'catppuccin',
			config = function() require('plugins.colorscheme') end,
		}

		use {
			'dracula/vim',
			commit = commits['dracula/vim'],
			config = function() require('plugins.colorscheme') end,
			as = 'dracula',
		}

		use {
			'folke/tokyonight.nvim',
			commit = commits['folke/tokyonight.nvim'],
			config = function() require('plugins.colorscheme') end,
		}

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require('packer').sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'rounded' })
			end
		},
		compile_on_sync = true,
		profile = {
			enable = true,
			threshold = 0
		}
	}
})
