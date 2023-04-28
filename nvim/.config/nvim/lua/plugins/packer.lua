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
	['ThePrimeagen/refactoring.nvim'] = 'e7c40818b2995016ede93c5620055206b1aba44f',
	['akinsho/toggleterm.nvim'] = '1c5996ee3c30b54751093fe68d40676859e7778f',
	['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
	['catppuccin/nvim'] = '6eb93f7240476ac51cec909fe0016e9a269c2a92',
	['dracula/vim'] = 'eb577d47b0cfc9191bf04c414b4042d5f1a980f8',
	['dstein64/vim-startuptime'] = 'c13eb0cfa0e27a651c60431c49819aec80da2ad7',
	['folke/tokyonight.nvim'] = 'ff81eac0ecf85db235dfc4c9d54f2d07d662a423',
	['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'de02085d6af1633942549a238bc7a5524fa9b201',
	['github/copilot.vim'] = 'b6e5624351ba735e25eb8864d7d22819aad00606',
	['glacambre/firenvim'] = 'ee4ef314bd990b2b05b7fbd95b857159e444a2fe',
	['glepnir/dashboard-nvim'] = '275e7c8579858c3ee06f32c16bdc687153ca7204',
	['gpanders/editorconfig.nvim'] = '5b9e303e1d6f7abfe616ce4cc8d3fffc554790bf',
	['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
	['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
	['hrsh7th/cmp-calc'] = '50792f34a628ea6eb31d2c90e8df174671e4e7a0',
	['hrsh7th/cmp-cmdline'] = 'af88e700417c6449719fc77f6f3745f88e42d5da',
	['hrsh7th/cmp-nvim-lsp'] = '0e6b2ed705ddcff9738ec4ea838141654f12eeef',
	['hrsh7th/cmp-path'] = '91ff86cd9c29299a64f968ebb45846c485725f23',
	['hrsh7th/cmp-vsnip'] = '989a8a73c44e926199bfd05fa7a516d51f2d2752',
	['hrsh7th/nvim-cmp'] = '777450fd0ae289463a14481673e26246b5e38bf2',
	['hrsh7th/vim-vsnip'] = '7753ba9c10429c29d25abfd11b4c60b76718c438',
	['jayp0521/mason-null-ls.nvim'] = '834bb5d6dd72db0a82d4b90a25500fdc14a3bc43',
	['jose-elias-alvarez/null-ls.nvim'] = 'f8ffcd7cb8fb3325c711d459152ef132b5b65aed',
	['kiyoon/treesitter-indent-object.nvim'] = '50c2301c3b3785430df77856be59dc9fec7347d8',
	['kyazdani42/nvim-tree.lua'] = '0db85a70248f9a90e61af5cdbafe5d9f4320f719',
	['kyazdani42/nvim-web-devicons'] = '4ec26d67d419c12a4abaea02f1b6c57b40c08d7e',
	['lewis6991/gitsigns.nvim'] = '372d5cb485f2062ac74abc5b33054abac21d8b58',
	['lukas-reineke/indent-blankline.nvim'] = '018bd04d80c9a73d399c1061fa0c3b14a7614399',
	['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
	['mbbill/undotree'] = '485f01efde4e22cb1ce547b9e8c9238f36566f21',
	['mfussenegger/nvim-dap'] = 'debd7c2f80eaf20c5f5df25db8d8c1b9b18f4421',
	['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
	['neovim/nvim-lspconfig'] = 'eddaef928c1e1dd79a96f5db45f2fd7f2efe7ea0',
	['numToStr/Comment.nvim'] = 'a89339ffbee677ab0521a483b6dac7e2e67c907e',
	['nvim-lua/plenary.nvim'] = '9ac3e9541bbabd9d73663d757e4fe48a675bb054',
	['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
	['nvim-telescope/telescope.nvim'] = '6258d50b09f9ae087317e392efe7c05a7323492d',
	['nvim-treesitter/nvim-treesitter'] = '831f37635df26864a397a5e35450eec97bfe60cd',
	['nvim-treesitter/playground'] = '2b81a018a49f8e476341dfcb228b7b808baba68b',
	['onsails/lspkind-nvim'] = 'c68b3a003483cf382428a43035079f78474cd11e',
	['phaazon/hop.nvim'] = '90db1b2c61b820e230599a04fedcd2679e64bd07',
	['rafamadriz/friendly-snippets'] = 'b1b78a6433268fc172adb5a843e165035e83861e',
	['simrat39/symbols-outline.nvim'] = '512791925d57a61c545bc303356e8a8f7869763c',
	['tpope/vim-fugitive'] = 'e6651a79facf5cc2b7c554fdc19eb8a9fe89602c',
	['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
	['tpope/vim-surround'] = '3d188ed2113431cf8dac77be61b842acb64433d9',
	['wbthomason/packer.nvim'] = '1d0cf98a561f7fd654c970c49f917d74fafe1530',
	['williamboman/mason-lspconfig.nvim'] = '7034065099c1665143091c7282b3b1b8f0b23783',
	['williamboman/mason.nvim'] = 'b20a4bd32247411d39d8dd5c94e2e5c87d98556d',
	['windwp/nvim-autopairs'] = '58985de5eeab159462bc262de5cc1b9c9b375595',
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
			'glepnir/dashboard-nvim',
			commit = commits['glepnir/dashboard-nvim'],
			config = function() require('plugins.config.dashboard') end,
		}

		use {
			'mfussenegger/nvim-dap',
			commit = commits['mfussenegger/nvim-dap'],
			config = function() require('plugins.config.dap') end,
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
		}

		-- TODO: Remove this once nvim 0.9 comes out, as it's supported by
		-- default
		use {
			'gpanders/editorconfig.nvim',
			commit = commits['gpanders/editorconfig.nvim'],
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

		use {
			'glacambre/firenvim',
			commit = commits['glacambre/firenvim'],
			run = function() vim.fn['firenvim#install'](0) end,
			config = function() require('plugins.config.firenvim') end,
			cond = function() return vim.g.started_by_firenvim end,
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

		-- point 1
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
			'simrat39/symbols-outline.nvim',
			commit = commits['simrat39/symbols-outline.nvim'],
			config = function() require('plugins.config.symbols-outline') end,
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

		-- point 2


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

		-- point 3 (problems here with TSUpdate and Cursor autocommands


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
