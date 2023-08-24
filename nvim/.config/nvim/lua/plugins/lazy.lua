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
	['Exafunction/codeium.vim'] = '1875071b3c456baf121ffa68d2947e8488229e51',
	['ThePrimeagen/refactoring.nvim'] = '2cfd6ddb0acece95d9658560ae9740b98ef70dbb',
	['akinsho/toggleterm.nvim'] = '12cba0a1967b4f3f31903484dec72a6100dcf515',
	['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
	['catppuccin/nvim'] = 'da8f4875bdc4d73ff039c2e42a3ef931414e50bd',
	['dracula/vim'] = '248e649f2fbd262292ee4196cadb5b7f38168f37',
	['dstein64/vim-startuptime'] = '454b3de856b7bd298700de33d79774ca9b9e3875',
	['folke/tokyonight.nvim'] = '1ee11019f8a81dac989ae1db1a013e3d582e2033',
	['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'de02085d6af1633942549a238bc7a5524fa9b201',
	['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
	['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
	['hrsh7th/cmp-calc'] = 'ce91d14d2e7a8b3f6ad86d85e34d41c1ae6268d9',
	['hrsh7th/cmp-cmdline'] = '8ee981b4a91f536f52add291594e89fb6645e451',
	['hrsh7th/cmp-nvim-lsp'] = '44b16d11215dce86f253ce0c30949813c0a90765',
	['hrsh7th/cmp-path'] = '91ff86cd9c29299a64f968ebb45846c485725f23',
	['hrsh7th/cmp-vsnip'] = '989a8a73c44e926199bfd05fa7a516d51f2d2752',
	['hrsh7th/nvim-cmp'] = '51f1e11a89ec701221877532ee1a23557d291dd5',
	['hrsh7th/vim-vsnip'] = '7753ba9c10429c29d25abfd11b4c60b76718c438',
	['jay-babu/mason-nvim-dap.nvim'] = '6148b51db945b55b3b725da39eaea6441e59dff8',
	['kyazdani42/nvim-tree.lua'] = '920868dba13466586897a8f40220eca6b2caac41',
	['kyazdani42/nvim-web-devicons'] = 'cfc8824cc1db316a276b36517f093baccb8e799a',
	['lewis6991/gitsigns.nvim'] = '749267aaa863c30d721c9913699c5d94e0c07dd3',
	['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
	['mbbill/undotree'] = '0e11ba7325efbbb3f3bebe06213afa3e7ec75131',
	['mfussenegger/nvim-dap'] = '897c433ff2fbcf6f71a57bf18460d810e173d1e0',
	['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
	['neovim/nvim-lspconfig'] = 'f7922e59aeb9bc3e31a660ea4e7405ffa3fc2c3a',
	['numToStr/Comment.nvim'] = '0236521ea582747b58869cb72f70ccfa967d2e89',
	['nvim-lua/plenary.nvim'] = '267282a9ce242bbb0c5dc31445b6d353bed978bb',
	['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
	['nvim-telescope/telescope.nvim'] = '2d92125620417fbea82ec30303823e3cd69e90e8',
	['nvim-treesitter/nvim-treesitter'] = '05fe2c38a3bd4f889ac13f1735685ab348d95346',
	['nvim-treesitter/playground'] = '2b81a018a49f8e476341dfcb228b7b808baba68b',
	['onsails/lspkind-nvim'] = '57610d5ab560c073c465d6faf0c19f200cb67e6e',
	['phaazon/hop.nvim'] = '03f0434869f1f38868618198b5f4f2ab6d39aef2',
	['rafamadriz/friendly-snippets'] = '377d45475b49e37460a902d6d569d2093d4037d0',
	['tpope/vim-fugitive'] = 'b3b838d690f315a503ec4af8c634bdff3b200aaf',
	['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
	['tpope/vim-surround'] = '3d188ed2113431cf8dac77be61b842acb64433d9',
	['williamboman/mason-lspconfig.nvim'] = '2997f467881ac4faa6f8c5e7065e3a672297c8ad',
	['williamboman/mason.nvim'] = 'a51c2d063c5377ee9e58c5f9cda7c7436787be72',
	['windwp/nvim-autopairs'] = 'ae5b41ce880a6d850055e262d6dfebd362bb276e',
	['mfussenegger/nvim-lint'] = '8f0ec4e1fe9df05b14b95ebdab4c0ffea35762e5',
	['mhartington/formatter.nvim'] = '44c89f09dcc220dc2a9b056e93c3a87c86e79804',
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
		enabled = false,
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
