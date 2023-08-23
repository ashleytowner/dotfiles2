local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local commits = {
	['Exafunction/codeium.vim'] = '3387991fc87288ed4281ff665645c11de5833cf5',
	['ThePrimeagen/refactoring.nvim'] = '08bcc40638cd4debd5184f934971858e1c5acff4',
	['akinsho/toggleterm.nvim'] = 'cf146a267a6a7db62b1e2aff40414b20081048a1',
	['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
	['catppuccin/nvim'] = 'ad6305594737e16155c41c176c611e865c26bb6d',
	['dracula/vim'] = '0bf17b30c93dc1358b8fc01e126ad1d12a272adb',
	['dstein64/vim-startuptime'] = '454b3de856b7bd298700de33d79774ca9b9e3875',
	['folke/tokyonight.nvim'] = '18259404c962736c70c0f670b71c976c4a5ac2bb',
	['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'de02085d6af1633942549a238bc7a5524fa9b201',
	['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
	['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
	['hrsh7th/cmp-calc'] = '50792f34a628ea6eb31d2c90e8df174671e4e7a0',
	['hrsh7th/cmp-cmdline'] = '8ee981b4a91f536f52add291594e89fb6645e451',
	['hrsh7th/cmp-nvim-lsp'] = '0e6b2ed705ddcff9738ec4ea838141654f12eeef',
	['hrsh7th/cmp-path'] = '91ff86cd9c29299a64f968ebb45846c485725f23',
	['hrsh7th/cmp-vsnip'] = '989a8a73c44e926199bfd05fa7a516d51f2d2752',
	['hrsh7th/nvim-cmp'] = 'fa492591fecdc41798cd5d3d1713232a5088fba0',
	['hrsh7th/vim-vsnip'] = '7753ba9c10429c29d25abfd11b4c60b76718c438',
	['jay-babu/mason-nvim-dap.nvim'] = 'e4d56b400e9757b1dc77d620fd3069396e92d5fc',
	['kyazdani42/nvim-tree.lua'] = 'c3c6544ee00333b0f1d6a13735d0dd302dba4f70',
	['kyazdani42/nvim-web-devicons'] = '14b3a5ba63b82b60cde98d0a40319d80f25e8301',
	['lewis6991/gitsigns.nvim'] = '256569c2fe697a3003dbd49ff474e5935af9066c',
	['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
	['mbbill/undotree'] = '485f01efde4e22cb1ce547b9e8c9238f36566f21',
	['mfussenegger/nvim-dap'] = 'a6d48d23407fbad7a4c1451803b8f34cab31c441',
	['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
	['neovim/nvim-lspconfig'] = '9a2cc569c88662fa41d414bdb65b13ea72349f86',
	['numToStr/Comment.nvim'] = '176e85eeb63f1a5970d6b88f1725039d85ca0055',
	['nvim-lua/plenary.nvim'] = '36aaceb6e93addd20b1b18f94d86aecc552f30c4',
	['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
	['nvim-telescope/telescope.nvim'] = '00cf15074a2997487813672a75f946d2ead95eb0',
	['nvim-treesitter/nvim-treesitter'] = 'fdddbff57665c872a92108da41c87adf040fda2e',
	['nvim-treesitter/playground'] = '2b81a018a49f8e476341dfcb228b7b808baba68b',
	['onsails/lspkind-nvim'] = '57610d5ab560c073c465d6faf0c19f200cb67e6e',
	['phaazon/hop.nvim'] = '03f0434869f1f38868618198b5f4f2ab6d39aef2',
	['rafamadriz/friendly-snippets'] = '70b727d3454cceb3a818b1746be09786568b7e33',
	['tpope/vim-fugitive'] = '43f18ab9155c853a84ded560c6104e6300ad41da',
	['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
	['tpope/vim-surround'] = '3d188ed2113431cf8dac77be61b842acb64433d9',
	['williamboman/mason-lspconfig.nvim'] = 'd381fcb78d7a562c3244e1c8f76406954649db36',
	['williamboman/mason.nvim'] = 'f7f81ab41b153e2902ebded401a8a0a6abe28607',
	['windwp/nvim-autopairs'] = 'e8f7dd7a72de3e7b6626c050a802000e69d53ff0',
	['mfussenegger/nvim-lint'] = '4744fc04c3a869c9eaa137fec13d992aea7da7ee',
	['mhartington/formatter.nvim'] = '9bf2e7e294b00bac87c6123c889828ee08dc9b46',
}

local plugins = {
	{
		'nvim-lua/plenary.nvim',
		commit = commits['nvim-lua/plenary.nvim'],
	},

	{
		'williamboman/mason.nvim',
		commit = commits['williamboman/mason.nvim'],
		config = function()
			require('plugins.config.mason')
		end,
	},

	{
		'jay-babu/mason-nvim-dap.nvim',
		dependencies = {
			{ 'mfussenegger/nvim-dap' },
			{ 'williamboman/mason.nvim' },
		},
		commit = commits['jay-babu/mason-nvim-dap.nvim'],
		config = function()
			require('plugins.config.dap')
		end,
	},

	{
		'mfussenegger/nvim-dap',
		commit = commits['mfussenegger/nvim-dap'],
	},

	{
		'ThePrimeagen/refactoring.nvim',
		commit = commits['ThePrimeagen/refactoring.nvim'],
		config = function()
			require('plugins.config.refactoring')
		end,
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-treesitter/nvim-treesitter' },
		},
	},

	-- AI

	{
		'Exafunction/codeium.vim',
		commit = commits['Exafunction/codeium.vim'],
		config = function()
			require('plugins.config.codeium')
		end,
	},

	-- Util

	{
		'dstein64/vim-startuptime',
		commit = commits['dstein64/vim-startuptime'],
		cmd = 'StartupTime',
	},

	{
		'akinsho/toggleterm.nvim',
		commit = commits['akinsho/toggleterm.nvim'],
		config = function()
			require('plugins.config.toggleterm')
		end,
	},

	-- Motions & Objects

	{
		'tpope/vim-surround',
		commit = commits['tpope/vim-surround'],
		config = function()
			require('plugins.config.vimSurround')
		end,
		dependencies = {
			'tpope/vim-repeat',
			commit = commits['tpope/vim-repeat'],
		},
	},

	{
		'numToStr/Comment.nvim',
		commit = commits['numToStr/Comment.nvim'],
		config = function()
			require('plugins.config.Comment')
		end,
	},

	{
		'bkad/CamelCaseMotion',
		commit = commits['bkad/CamelCaseMotion'],
		config = function()
			require('plugins.config.camelCaseMotions')
		end,
	},

	{
		'phaazon/hop.nvim',
		commit = commits['phaazon/hop.nvim'],
		config = function()
			require('plugins.config.hop')
		end,
	},

	{
		'windwp/nvim-autopairs',
		commit = commits['windwp/nvim-autopairs'],
		config = function()
			require('plugins.config.autopairs')
		end,
		-- after = {
			-- 'nvim-cmp',
		-- },
		enabled = false,
	},

	{
		'mattn/emmet-vim',
		commit = commits['mattn/emmet-vim'],
	},

	-- Git

	{
		'lewis6991/gitsigns.nvim',
		commit = commits['lewis6991/gitsigns.nvim'],
		config = function()
			require('plugins.config.gitsigns')
		end,
		dependencies = {
			'nvim-lua/plenary.nvim',
			commit = commits['nvim-lua/plenary.nvim'],
		},
	},

	{
		'tpope/vim-fugitive',
		commit = commits['tpope/vim-fugitive'],
		config = function()
			require('plugins.config.fugitive')
		end,
		cmd = 'Git',
	},

	-- File Management

	{
		'nvim-telescope/telescope.nvim',
		commit = commits['nvim-telescope/telescope.nvim'],
		config = function()
			require('plugins.config.telescope')
		end,
		dependencies = {
			{
				'gbrlsnchs/telescope-lsp-handlers.nvim',
				commit = commits['gbrlsnchs/telescope-lsp-handlers.nvim'],
			},
			{
				'nvim-lua/plenary.nvim',
				commit = commits['nvim-lua/plenary.nvim'],
			},
			{
				'nvim-telescope/telescope-ui-select.nvim',
				commit = commits['nvim-telescope/telescope-ui-select.nvim'],
			},
		},
	},

	{
		'kyazdani42/nvim-tree.lua',
		commit = commits['kyazdani42/nvim-tree.lua'],
		dependencies = {
			{
				'kyazdani42/nvim-web-devicons',
				commit = commits['kyazdani42/nvim-web-devicons'],
			},
		},
		config = function()
			require('plugins.config.nvimTree')
		end,
	},

	{
		'mbbill/undotree',
		commit = commits['mbbill/undotree'],
		config = function()
			require('plugins.config.undotree')
		end,
	},

	-- LSP, Completion & Formatting

	{
		'neovim/nvim-lspconfig',
		commit = commits['neovim/nvim-lspconfig'],
		config = function()
			require('lsp')
		end,
		-- after = { 'mason.nvim' },
		dependencies = {
			{
				'williamboman/mason-lspconfig.nvim',
				commit = commits['williamboman/mason-lspconfig.nvim'],
			},
		},
	},

	{
		'mfussenegger/nvim-lint',
		commit = commits['mfussenegger/nvim-lint'],
		config = function()
			require('plugins.config.lint')
		end,
	},

	{
		'mhartington/formatter.nvim',
		commit = commits['mhartington/formatter.nvim'],
		config = function()
			require('plugins.config.formatter')
		end,
	},

	{
		'hrsh7th/nvim-cmp',
		commit = commits['hrsh7th/nvim-cmp'],
		config = function()
			require('plugins.config.cmp')
		end,
		dependencies = {
			{
				'hrsh7th/vim-vsnip',
				commit = commits['hrsh7th/vim-vsnip'],
				-- after = 'nvim-cmp',
				config = function()
					require('plugins.config.vsnip')
				end,
			},
			{
				'hrsh7th/cmp-vsnip',
				commit = commits['hrsh7th/cmp-vsnip'],
				-- after = 'nvim-cmp',
			},
			{
				'rafamadriz/friendly-snippets',
				commit = commits['rafamadriz/friendly-snippets'],
				-- after = 'nvim-cmp',
			},
			{
				'hrsh7th/cmp-buffer',
				commit = commits['hrsh7th/cmp-buffer'],
				-- after = 'nvim-cmp',
			},
			{
				'hrsh7th/cmp-calc',
				commit = commits['hrsh7th/cmp-calc'],
				-- after = 'nvim-cmp',
			},
			{
				'hrsh7th/cmp-cmdline',
				commit = commits['hrsh7th/cmp-cmdline'],
				-- after = 'nvim-cmp',
			},
			{
				'hrsh7th/cmp-nvim-lsp',
				commit = commits['hrsh7th/cmp-nvim-lsp'],
				-- after = 'nvim-cmp',
			},
			{
				'hrsh7th/cmp-path',
				commit = commits['hrsh7th/cmp-path'],
				-- after = 'nvim-cmp',
			},
			{
				'onsails/lspkind-nvim',
				commit = commits['onsails/lspkind-nvim'],
			},
		},
	},

	-- Syntax Highlighting

	{
		'nvim-treesitter/nvim-treesitter',
		commit = commits['nvim-treesitter/nvim-treesitter'],
		run = ':TSUpdate',
		config = function()
			require('plugins.config.treesitter')
		end,
	},

	{
		'nvim-treesitter/playground',
		commit = commits['nvim-treesitter/playground'],
		dependencies = 'nvim-treesitter/nvim-treesitter',
	},

	-- Theming

	{
		'haishanh/night-owl.vim',
		enabled = false,
		commit = commits['haishanh/night-owl.vim'],
	},

	{
		'rebelot/kanagawa.nvim',
		enabled = false,
		name = 'kanagawa',
		config = function()
			require('plugins.colorscheme')
		end,
	},

	{
		'catppuccin/nvim',
		commit = commits['catppuccin/nvim'],
		name = 'catppuccin',
		config = function()
			require('plugins.colorscheme')
		end,
	},

	{
		'dracula/vim',
		commit = commits['dracula/vim'],
		enabled = false,
		config = function()
			require('plugins.colorscheme')
		end,
		name = 'dracula',
	},

	{
		'folke/tokyonight.nvim',
		commit = commits['folke/tokyonight.nvim'],
		enabled = false,
		config = function()
			require('plugins.colorscheme')
		end,
	},
}

require('lazy').setup(plugins);

-- auto-sync when plugins file is saved
local lazy_user_config_group =
	vim.api.nvim_create_augroup('LazyUserConfig', { clear = true })

-- vim.api.nvim_create_autocmd('BufWritePost', {
-- 	pattern = 'lazy.lua',
-- 	group = lazy_user_config_group,
-- 	command = 'source <afile> | PackerSync',
-- })

-- Keybind to update a plugin hash
vim.api.nvim_create_autocmd('BufEnter', {
	pattern = 'lazy.lua',
	group = lazy_user_config_group,
	callback = function()
		vim.keymap.set('n', '<leader>Up', function()
			-- Delete the current hash and yank the plugin name
			vim.cmd("norm 0f=lD^yi'")
			local plugin_name = vim.fn.getreg('"')
			-- fetch the hash from github
			local hash = require('util').get_plugin_hash(plugin_name)
			-- put the hash back into the " register
			require('util').yank(hash)
			-- Paste the hash and prefix it with a '
			vim.cmd("norm pI'")
			-- Add ', to the end of the hash
			vim.cmd("norm A',")
			-- Join the lines and move down to the next line
			vim.cmd('norm kJj')
		end, { buffer = true })
	end,
})
