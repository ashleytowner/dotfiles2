local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local hashes = {
      ['wbthomason/packer.nvim'] = '213ed031490ab5318e7996a594b52131e5c1c06f',
      ['nvim-lua/plenary.nvim'] = '986ad71ae930c7d96e812734540511b4ca838aa2',
      ['williamboman/mason.nvim'] = '5676d6d63850ca63fe468a578387fed9eb0f69a3',
      ['williamboman/mason-lspconfig.nvim'] = 'f87c5796603aa3436d9cb1d36dbe5b2e579e4034',
      ['ThePrimeagen/refactoring.nvim'] = 'b11ca3574c85c98e07e4d5f8c47e38bacbbda34f',
      ['dstein64/vim-startuptime'] = '9a226125353e9c12742d72be6ab877573bfd651b',
      ['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
      ['akinsho/toggleterm.nvim'] = 'a7c9a6fd135f96639e2ac686691a32db6d011471',
      ['glacambre/firenvim'] = 'f679455c294c62eddee86959cfc9f1b1f79fe97d',
      ['tpope/vim-surround'] = 'bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea',
      ['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
      ['numToStr/Comment.nvim'] = '78ab4e9785b6da9b7a539df3bd6f70300dc9482b',
      ['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
      ['phaazon/hop.nvim'] = '2a1b686aad85a3c241f8cd8fd42eb09c7de5ed79',
      ['windwp/nvim-autopairs'] = '972a7977e759733dd6721af7bcda7a67e40c010e',
      ['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
      ['lewis6991/gitsigns.nvim'] = '8b817e76b6399634f3f49e682d6e409844241858',
      ['tpope/vim-fugitive'] = '66a921bbe38bea19f6b581c8a56d5a8a41209e35',
      ['nvim-telescope/telescope.nvim'] = 'b5833a682c511885887373aad76272ad70f7b3c2',
      ['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'd6d5983b0131ee2c386ca9e349f6621e12d971cb',
      ['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
      ['kyazdani42/nvim-tree.lua'] = '451901ca9c4a0d97d7b7cb93276be7ed5588b3ab',
      ['kyazdani42/nvim-web-devicons'] = '2d02a56189e2bde11edd4712fea16f08a6656944',
      ['neovim/nvim-lspconfig'] = 'df3be5006530ff73b57d6c302b4da7ed2b0e159d',
      ['hrsh7th/nvim-cmp'] = '706371f1300e7c0acb98b346f80dad2dd9b5f679',
      ['hrsh7th/cmp-vsnip'] = '0abfa1860f5e095a07c477da940cfcb0d273b700',
      ['hrsh7th/vim-vsnip'] = '8f199ef690ed26dcbb8973d9a6760d1332449ac9',
      ['rafamadriz/friendly-snippets'] = '1db69684a27eec0b9f520a5d7d95d414fc30ba91',
      ['hrsh7th/cmp-buffer'] = '62fc67a2b0205136bc3e312664624ba2ab4a9323',
      ['hrsh7th/cmp-calc'] = 'f7efc20768603bd9f9ae0ed073b1c129f63eb312',
      ['hrsh7th/cmp-cmdline'] = 'c36ca4bc1dedb12b4ba6546b96c43896fd6e7252',
      ['hrsh7th/cmp-nvim-lsp'] = 'affe808a5c56b71630f17aa7c38e15c59fd648a8',
      ['hrsh7th/cmp-path'] = '447c87cdd6e6d6a1d2488b1d43108bfa217f56e1',
      ['onsails/lspkind-nvim'] = '57e5b5dfbe991151b07d272a06e365a77cc3d0e7',
      ['nvim-treesitter/nvim-treesitter'] = '22824614163c54ef5d366b15c8685e24d33763db',
      ['nvim-treesitter/playground'] = 'ce7e4b757598f1c785ed0fd94fc65959acd7d39c',
      ['lilydjwg/colorizer'] = '72790a003d5a706c287486a1a81e3a6b32158b54',
      ['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
      ['dracula/vim'] = 'd7723a842a6cfa2f62cf85530ab66eb418521dc2',
      ['folke/tokyonight.nvim'] = '8223c970677e4d88c9b6b6d81bda23daf11062bb',
}

return require('packer').startup({
  function(use)

    use {
      'wbthomason/packer.nvim',
      commit = hashes['wbthomason/packer.nvim']
    }

    use {
      'nvim-lua/plenary.nvim',
      commit = hashes['nvim-lua/plenary.nvim']
    }

    use {
      'williamboman/mason.nvim',
      commit = hashes['williamboman/mason.nvim'],
      config = function() require('mason').setup() end
    }

    use {
      'williamboman/mason-lspconfig.nvim',
      commit = hashes['williamboman/mason-lspconfig.nvim'],
      config = function() require('plugins.masonlsp') end,
      after = { 'nvim-lspconfig' },
      require = { 'nvim-lspconfig' }
    }

    use {
      'ThePrimeagen/refactoring.nvim',
      commit = hashes['ThePrimeagen/refactoring.nvim'],
      config = function() require('refactoring').setup({}) end,
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-treesitter/nvim-treesitter'}
      }
    }

    -- Util

    use {
      'dstein64/vim-startuptime',
      commit = hashes['dstein64/vim-startuptime'],
      cmd = 'StartupTime',
    }

    use {
      'mhinz/vim-startify',
      commit = hashes['mhinz/vim-startify'],
      config = function() require('plugins.startify') end,
      disable = true
    }

    use {
      'akinsho/toggleterm.nvim',
      commit = hashes['akinsho/toggleterm.nvim'],
      config = function() require('toggleterm').setup({
        open_mapping = [[<C-\>]]
      }) end
    }

    use {
      'glacambre/firenvim',
      commit = hashes['glacambre/firenvim'],
      run = function() vim.fn['firenvim#install'](0) end,
      config = function() require('plugins.firenvim') end,
      cond = function() return vim.g.started_by_firenvim end
    }


    -- Motions & Objects

    use {
      'tpope/vim-surround',
      commit = hashes['tpope/vim-surround'],
      config = function() require('plugins.vimSurround') end,
      requires = {
        'tpope/vim-repeat',
        commit = hashes['tpope/vim-repeat']
      }
    }

    use {
      'numToStr/Comment.nvim',
      commit = hashes['numToStr/Comment.nvim'],
      config = function() require('Comment').setup({}) end,
    }

    use {
      'bkad/CamelCaseMotion',
      commit = hashes['bkad/CamelCaseMotion'],
      config = function() require('plugins.camelCaseMotions') end,
    }

    use {
      'phaazon/hop.nvim',
      commit = hashes['phaazon/hop.nvim'],
      config = function() require('plugins.hop') end,
      cond = function() return not vim.g.vscode end,
    }

    use {
      'windwp/nvim-autopairs',
      commit = hashes['windwp/nvim-autopairs'],
      config = function() require('plugins.autopairs') end,
      after = {
        'nvim-cmp'
      }
    }

    use {
      'mattn/emmet-vim',
      commit = hashes['mattn/emmet-vim']
    }

    -- Git

    use {
      'lewis6991/gitsigns.nvim',
      commit = hashes['lewis6991/gitsigns.nvim'],
      config = function() require('plugins.gitsigns') end,
      requires = {
        'nvim-lua/plenary.nvim',
        commit = hashes['nvim-lua/plenary.nvim']
      },
    }

    use {
      'tpope/vim-fugitive',
      commit = hashes['tpope/vim-fugitive'],
      config = function() require('plugins.fugitive') end,
      cond = function() return not vim.g.vscode end,
      cmd = 'Git',
    }

    -- File Management
    use {
      'nvim-telescope/telescope.nvim',
      commit = hashes['nvim-telescope/telescope.nvim'],
      cond = function() return vim.g.vscode end,
      config = function() require('plugins.telescope') end,
      requires = {
        {
          'gbrlsnchs/telescope-lsp-handlers.nvim',
          commit = hashes['gbrlsnchs/telescope-lsp-handlers.nvim']
        },
        {
          'nvim-lua/plenary.nvim',
          commit = hashes['nvim-lua/plenary.nvim']
        },
        {
          'nvim-telescope/telescope-ui-select.nvim',
          commit = hashes['nvim-telescope/telescope-ui-select.nvim']
        }
      }
    }

    use {
      'kyazdani42/nvim-tree.lua',
      commit = hashes['kyazdani42/nvim-tree.lua'],
      requires = {
        {
          'kyazdani42/nvim-web-devicons',
          commit = hashes['kyazdani42/nvim-web-devicons']
        }, -- optional, for file icon
      },
      config = function() require('plugins.nvimTree') end
    }

    -- LSP, Completion & Formatting

    use {
      'neovim/nvim-lspconfig',
      commit = hashes['neovim/nvim-lspconfig'],
      cond = function() return not vim.g.vscode end,
      config = function() require('lsp.init') end,
    }

    use {
      'hrsh7th/nvim-cmp',
      commit = hashes['hrsh7th/nvim-cmp'],
      config = function() require('plugins.cmp') end,
      cond = function() return not vim.g.vscode end,
      event = 'InsertEnter',
      requires = {
        {
          'hrsh7th/cmp-vsnip',
          commit = hashes['hrsh7th/cmp-vsnip'],
          after = 'nvim-cmp'
        },
        {
          'hrsh7th/vim-vsnip',
          commit = hashes['hrsh7th/vim-vsnip'],
          after = 'nvim-cmp'
        },
        {
          'rafamadriz/friendly-snippets',
          commit = hashes['rafamadriz/friendly-snippets'],
          after = 'nvim-cmp',
        },
        {
          'hrsh7th/cmp-buffer',
          commit = hashes['hrsh7th/cmp-buffer'],
          after = 'nvim-cmp',
        },
        {
          'hrsh7th/cmp-calc',
          commit = hashes['hrsh7th/cmp-calc'],
          after = 'nvim-cmp',
        },
        {
          'hrsh7th/cmp-cmdline',
          commit = hashes['hrsh7th/cmp-cmdline'],
          after = 'nvim-cmp',
        },
        {
          'hrsh7th/cmp-nvim-lsp',
          commit = hashes['hrsh7th/cmp-nvim-lsp'],
          after = 'nvim-cmp',
        },
        {
          'hrsh7th/cmp-path',
          commit = hashes['hrsh7th/cmp-path'],
          after = 'nvim-cmp',
        },
        {
          'onsails/lspkind-nvim',
          commit = hashes['onsails/lspkind-nvim']
        }
      }
    }

    -- use {
    --   'mhartington/formatter.nvim',
    --   commit = hashes['mhartington/formatter.nvim'],
    --   config = function() require('plugins.formatter') end,
    -- }

    -- Syntax

    use {
      'nvim-treesitter/nvim-treesitter',
      commit = hashes['nvim-treesitter/nvim-treesitter'],
      run = ':TSUpdate',
      config = function() require('plugins.treesitter') end,
    }

    use {
      'nvim-treesitter/playground',
      commit = hashes['nvim-treesitter/playground'],
      requires = 'nvim-treesitter/nvim-treesitter',
    }

    use {
      'lilydjwg/colorizer',
      commit = hashes['lilydjwg/colorizer']
    }

    -- Theming

    use {
      'haishanh/night-owl.vim',
      commit = hashes['haishanh/night-owl.vim'],
      cond = function() return not vim.g.vscode end,
      disabled = true,
    }

    use {
      'dracula/vim',
      commit = hashes['dracula/vim'],
      as = 'dracula',
      disabled = true,
    }

    use {
      'folke/tokyonight.nvim',
      commit = hashes['folke/tokyonight.nvim'],
      setup = function() require('plugins.themes.tokyonight') end,
      config = function() vim.cmd('colorscheme tokyonight') end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if Packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    compile_on_sync = true,
    profile = {
      enable = true,
      threshold = 0
    }
  }
})
