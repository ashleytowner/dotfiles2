-- Boostrap packer
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
	['ThePrimeagen/refactoring.nvim'] = '57c32c6b7a211e5a3a5e4ddc4ad2033daff5cf9a',
	['akinsho/toggleterm.nvim'] = 'b86982429325112d2b20c6d0cc7a5c4b182ab705',
	['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
	['catppuccin/nvim'] = '73587f9c454da81679202f1668c30fea6cdafd5e',
	['dracula/vim'] = 'eb577d47b0cfc9191bf04c414b4042d5f1a980f8',
	['dstein64/vim-startuptime'] = '6580cf539c33a212f4f5542068a3b4dd2b3ad834',
	['folke/tokyonight.nvim'] = '1b0c88094548a62641ece1e668fa9a234e1c539e',
	['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'de02085d6af1633942549a238bc7a5524fa9b201',
	['github/copilot.vim'] = 'b6e5624351ba735e25eb8864d7d22819aad00606',
	['glacambre/firenvim'] = 'ee4ef314bd990b2b05b7fbd95b857159e444a2fe',
	['glepnir/dashboard-nvim'] = '4c2b038c5cfa70f90506f1551e5fd2d040174e08',
	['gpanders/editorconfig.nvim'] = '5b9e303e1d6f7abfe616ce4cc8d3fffc554790bf',
	['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
	['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
	['hrsh7th/cmp-calc'] = '50792f34a628ea6eb31d2c90e8df174671e4e7a0',
	['hrsh7th/cmp-cmdline'] = '8fcc934a52af96120fe26358985c10c035984b53',
	['hrsh7th/cmp-nvim-lsp'] = '0e6b2ed705ddcff9738ec4ea838141654f12eeef',
	['hrsh7th/cmp-path'] = '91ff86cd9c29299a64f968ebb45846c485725f23',
	['hrsh7th/cmp-vsnip'] = '989a8a73c44e926199bfd05fa7a516d51f2d2752',
	['hrsh7th/nvim-cmp'] = '777450fd0ae289463a14481673e26246b5e38bf2',
	['hrsh7th/vim-vsnip'] = '7753ba9c10429c29d25abfd11b4c60b76718c438',
	['jayp0521/mason-null-ls.nvim'] = 'a991e7697514f30126fac7c07a11c488c553e94f',
	['jose-elias-alvarez/null-ls.nvim'] = 'defa0518762abb32279d601443344fb9773f9330',
	['kiyoon/treesitter-indent-object.nvim'] = '50c2301c3b3785430df77856be59dc9fec7347d8',
	['kyazdani42/nvim-tree.lua'] = '45400cd7e02027937cd5e49845545e606ecf5a1f',
	['kyazdani42/nvim-web-devicons'] = '0568104bf8d0c3ab16395433fcc5c1638efc25d4',
	['lewis6991/gitsigns.nvim'] = 'f412f51d0eaf0905a2759c8087090071689bb8fb',
	['lukas-reineke/indent-blankline.nvim'] = '018bd04d80c9a73d399c1061fa0c3b14a7614399',
	['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
	['mbbill/undotree'] = '485f01efde4e22cb1ce547b9e8c9238f36566f21',
	['mfussenegger/nvim-dap'] = '1dd02e82c77d558e30ba831db4c2e7ed534e874f',
	['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
	['neovim/nvim-lspconfig'] = '0bc0c38e1b11dfb6b5f1794d53869f89ccf9e78f',
	['numToStr/Comment.nvim'] = '8d3aa5c22c2d45e788c7a5fe13ad77368b783c20',
	['nvim-lua/plenary.nvim'] = '253d34830709d690f013daf2853a9d21ad7accab',
	['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
	['nvim-telescope/telescope.nvim'] = '942fe5faef47b21241e970551eba407bc10d9547',
	['nvim-treesitter/nvim-treesitter'] = 'cbfa7cae1b38e1b843b2275d633ddbb05a105906',
	['nvim-treesitter/playground'] = '4044b53c4d4fcd7a78eae20b8627f78ce7dc6f56',
	['onsails/lspkind-nvim'] = 'c68b3a003483cf382428a43035079f78474cd11e',
	['phaazon/hop.nvim'] = '90db1b2c61b820e230599a04fedcd2679e64bd07',
	['rafamadriz/friendly-snippets'] = '8d91ba2dc2421a54981115f61b914974f938fa77',
	['simrat39/symbols-outline.nvim'] = '512791925d57a61c545bc303356e8a8f7869763c',
	['tpope/vim-fugitive'] = 'ef99f1d90cdb33a52931aed5868785b51fb9411d',
	['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
	['tpope/vim-surround'] = '3d188ed2113431cf8dac77be61b842acb64433d9',
	['wbthomason/packer.nvim'] = '1d0cf98a561f7fd654c970c49f917d74fafe1530',
	['williamboman/mason-lspconfig.nvim'] = 'b64fdede85fd5e0b720ce722919e0a9b95ed6547',
	['williamboman/mason.nvim'] = '46abd3ff86c74294fed9a530ec872ec7a4680bef',
	['windwp/nvim-autopairs'] = '0fd6519d44eac3a6736aafdb3fe9da916c3701d4',
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
