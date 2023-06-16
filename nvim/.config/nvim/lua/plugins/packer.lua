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
	['Exafunction/codeium.vim'] = '99714b06b85e79d9247066f7612e9cc55458bcf1',
	['ThePrimeagen/refactoring.nvim'] = '08bcc40638cd4debd5184f934971858e1c5acff4',
	['akinsho/toggleterm.nvim'] = 'cf146a267a6a7db62b1e2aff40414b20081048a1',
	['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
	['catppuccin/nvim'] = 'ad6305594737e16155c41c176c611e865c26bb6d',
	['dracula/vim'] = '0bf17b30c93dc1358b8fc01e126ad1d12a272adb',
	['dstein64/vim-startuptime'] = '454b3de856b7bd298700de33d79774ca9b9e3875',
	['folke/tokyonight.nvim'] = '161114bd39b990995e08dbf941f6821afbdcd666',
	['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'de02085d6af1633942549a238bc7a5524fa9b201',
	['github/copilot.vim'] = '1358e8e45ecedc53daf971924a0541ddf6224faf',
	['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
	['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
	['hrsh7th/cmp-calc'] = '50792f34a628ea6eb31d2c90e8df174671e4e7a0',
	['hrsh7th/cmp-cmdline'] = '8ee981b4a91f536f52add291594e89fb6645e451',
	['hrsh7th/cmp-nvim-lsp'] = '0e6b2ed705ddcff9738ec4ea838141654f12eeef',
	['hrsh7th/cmp-path'] = '91ff86cd9c29299a64f968ebb45846c485725f23',
	['hrsh7th/cmp-vsnip'] = '989a8a73c44e926199bfd05fa7a516d51f2d2752',
	['hrsh7th/nvim-cmp'] = 'b8c2a62b3bd3827aa059b43be3dd4b5c45037d65',
	['hrsh7th/vim-vsnip'] = '7753ba9c10429c29d25abfd11b4c60b76718c438',
	['jay-babu/mason-nvim-dap.nvim'] = 'e4d56b400e9757b1dc77d620fd3069396e92d5fc',
	['jayp0521/mason-null-ls.nvim'] = '54d702020bf94e4eefd357f0b738317af30217eb',
	['jose-elias-alvarez/null-ls.nvim'] = 'bbaf5a96913aa92281f154b08732be2f57021c45',
	['kyazdani42/nvim-tree.lua'] = 'f873625d0636889af4cd47a01e486beb865db205',
	['kyazdani42/nvim-web-devicons'] = '2a125024a137677930efcfdf720f205504c97268',
	['lewis6991/gitsigns.nvim'] = '4f8f66da9816ec4c4847653c9ab9bcb9c609508c',
	['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
	['mbbill/undotree'] = '485f01efde4e22cb1ce547b9e8c9238f36566f21',
	['mfussenegger/nvim-dap'] = 'a6d48d23407fbad7a4c1451803b8f34cab31c441',
	['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
	['neovim/nvim-lspconfig'] = '295c646488d5baa63c6c4da68fe61171b9257375',
	['numToStr/Comment.nvim'] = '176e85eeb63f1a5970d6b88f1725039d85ca0055',
	['nvim-lua/plenary.nvim'] = '36aaceb6e93addd20b1b18f94d86aecc552f30c4',
	['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
	['nvim-telescope/telescope.nvim'] = '00cf15074a2997487813672a75f946d2ead95eb0',
	['nvim-treesitter/nvim-treesitter'] = '10b0da9f931c734b531eb095ea01cce53984205c',
	['nvim-treesitter/playground'] = '2b81a018a49f8e476341dfcb228b7b808baba68b',
	['onsails/lspkind-nvim'] = '57610d5ab560c073c465d6faf0c19f200cb67e6e',
	['phaazon/hop.nvim'] = '03f0434869f1f38868618198b5f4f2ab6d39aef2',
	['rafamadriz/friendly-snippets'] = '9ec817dedd4474f16fc170910da9a2f5a8b262b6',
	['tpope/vim-fugitive'] = '43f18ab9155c853a84ded560c6104e6300ad41da',
	['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
	['tpope/vim-surround'] = '3d188ed2113431cf8dac77be61b842acb64433d9',
	['wbthomason/packer.nvim'] = '1d0cf98a561f7fd654c970c49f917d74fafe1530',
	['williamboman/mason-lspconfig.nvim'] = 'd381fcb78d7a562c3244e1c8f76406954649db36',
	['williamboman/mason.nvim'] = '4be1226f48bc2011024110f37b17f5ee468df58f',
	['windwp/nvim-autopairs'] = '41803bdbf75569571f93fd4571f6c654635b1b46',
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

		use {
			'github/copilot.vim',
			commit = commits['github/copilot.vim'],
			config = function() require('plugins.config.copilot') end,
			disable = true
		}

		use {
			'Exafunction/codeium.vim',
			commit = commits['Exafunction/codeium.vim'],
			config = function() require('plugins.config.codeium') end,
			-- disable = true
		}

		-- Util

		use {
			'dstein64/vim-startuptime',
			commit = commits['dstein64/vim-startuptime'],
			cmd = 'StartupTime',
		}

		use {
			'akinsho/toggleterm.nvim',
			commit = commits['akinsho/toggleterm.nvim'],
			config = function() require('plugins.config.toggleterm') end,
		}

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

		use {
			'neovim/nvim-lspconfig',
			commit = commits['neovim/nvim-lspconfig'],
			config = function() require('lsp') end,
			after = { 'mason.nvim' },
			requires = {
				{
					'williamboman/mason-lspconfig.nvim',
					commit = commits['williamboman/mason-lspconfig.nvim'],
				}
			},
		}

		use {
			'jose-elias-alvarez/null-ls.nvim',
			commit = commits['jose-elias-alvarez/null-ls.nvim'],
			config = function() require('lsp.null-ls') end,
			after = { 'mason.nvim' },
			requires = {
				{
					'jayp0521/mason-null-ls.nvim',
					commit = commits['jayp0521/mason-null-ls.nvim']
				}
			},
		}

		use {
			'hrsh7th/nvim-cmp',
			commit = commits['hrsh7th/nvim-cmp'],
			config = function() require('plugins.config.cmp') end,
			requires = {
				{
					'hrsh7th/vim-vsnip',
					commit = commits['hrsh7th/vim-vsnip'],
					after = 'nvim-cmp',
					config = function() require('plugins.config.vsnip') end,
				},
				{
					'hrsh7th/cmp-vsnip',
					commit = commits['hrsh7th/cmp-vsnip'],
					after = 'nvim-cmp'
				},
				{
					'rafamadriz/friendly-snippets',
					commit = commits['rafamadriz/friendly-snippets'],
					after = 'nvim-cmp',
				},
				{
					'hrsh7th/cmp-buffer',
					commit = commits['hrsh7th/cmp-buffer'],
					after = 'nvim-cmp',
				},
				{
					'hrsh7th/cmp-calc',
					commit = commits['hrsh7th/cmp-calc'],
					after = 'nvim-cmp',
				},
				{
					'hrsh7th/cmp-cmdline',
					commit = commits['hrsh7th/cmp-cmdline'],
					after = 'nvim-cmp',
				},
				{
					'hrsh7th/cmp-nvim-lsp',
					commit = commits['hrsh7th/cmp-nvim-lsp'],
					after = 'nvim-cmp',
				},
				{
					'hrsh7th/cmp-path',
					commit = commits['hrsh7th/cmp-path'],
					after = 'nvim-cmp',
				},
				{
					'onsails/lspkind-nvim',
					commit = commits['onsails/lspkind-nvim']
				}
			},
		}

		-- Syntax Highlighting

		use {
			'nvim-treesitter/nvim-treesitter',
			commit = commits['nvim-treesitter/nvim-treesitter'],
			run = ':TSUpdate',
			config = function() require('plugins.config.treesitter') end,
		}

		use {
			'nvim-treesitter/playground',
			commit = commits['nvim-treesitter/playground'],
			requires = 'nvim-treesitter/nvim-treesitter',
		}

		-- Theming

		use {
			'haishanh/night-owl.vim',
			commit = commits['haishanh/night-owl.vim'],
		}

		use {
			'rebelot/kanagawa.nvim',
			as = 'kanagawa',
			config = function() require('plugins.colorscheme') end
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
