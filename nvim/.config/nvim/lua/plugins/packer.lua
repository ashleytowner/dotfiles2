local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({
  function(use)

    use {
      'wbthomason/packer.nvim',
      commit = '213ed031490ab5318e7996a594b52131e5c1c06f'
    }

    use {
      'nvim-lua/plenary.nvim',
      commit = '986ad71ae930c7d96e812734540511b4ca838aa2'
    }

    use {
      'williamboman/mason.nvim',
      commit = '5676d6d63850ca63fe468a578387fed9eb0f69a3',
      config = function() require('mason').setup() end
    }

    use {
      'williamboman/mason-lspconfig.nvim',
      commit = 'f87c5796603aa3436d9cb1d36dbe5b2e579e4034',
      config = function() require('plugins.masonlsp') end,
      after = { 'nvim-lspconfig' },
      require = { 'nvim-lspconfig' }
    }

    use {
      'ThePrimeagen/refactoring.nvim',
      commit = 'b11ca3574c85c98e07e4d5f8c47e38bacbbda34f',
      config = function() require('refactoring').setup({}) end,
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-treesitter/nvim-treesitter'}
      }
    }

    -- Util

    use {
      'dstein64/vim-startuptime',
      commit = '9a226125353e9c12742d72be6ab877573bfd651b',
      cmd = 'StartupTime',
    }

    use {
      'mhinz/vim-startify',
      commit = '81e36c352a8deea54df5ec1e2f4348685569bed2',
      config = function() require('plugins.startify') end,
      disable = true
    }

    use {
      'akinsho/toggleterm.nvim',
      commit = 'a7c9a6fd135f96639e2ac686691a32db6d011471',
      config = function() require('toggleterm').setup({
        open_mapping = [[<C-\>]]
      }) end
    }

    use {
      'glacambre/firenvim',
      commit = 'f679455c294c62eddee86959cfc9f1b1f79fe97d',
      run = function() vim.fn['firenvim#install'](0) end,
      config = function() require('plugins.firenvim') end,
      cond = function() return vim.g.started_by_firenvim end
    }


    -- Motions & Objects

    use {
      'tpope/vim-surround',
      commit = 'bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea',
      config = function() require('plugins.vimSurround') end,
      requires = {
        'tpope/vim-repeat',
        commit = '24afe922e6a05891756ecf331f39a1f6743d3d5a'
      }
    }

    use {
      'numToStr/Comment.nvim',
      commit = '78ab4e9785b6da9b7a539df3bd6f70300dc9482b',
      config = function() require('Comment').setup({}) end,
    }

    use {
      'bkad/CamelCaseMotion',
      commit = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
      config = function() require('plugins.camelCaseMotions') end,
    }

    use {
      'phaazon/hop.nvim',
      commit = '2a1b686aad85a3c241f8cd8fd42eb09c7de5ed79',
      config = function() require('plugins.hop') end,
      cond = function() return not vim.g.vscode end,
    }

    use {
      'windwp/nvim-autopairs',
      commit = '972a7977e759733dd6721af7bcda7a67e40c010e',
      config = function() require('plugins.autopairs') end,
      after = {
        'nvim-cmp'
      }
    }

    use {
      'mattn/emmet-vim',
      commit = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d'
    }

    -- Git

    use {
      'lewis6991/gitsigns.nvim',
      commit = '8b817e76b6399634f3f49e682d6e409844241858',
      config = function() require('plugins.gitsigns') end,
      requires = {
        'nvim-lua/plenary.nvim',
        commit = '986ad71ae930c7d96e812734540511b4ca838aa2'
      },
    }

    use {
      'tpope/vim-fugitive',
      commit = '66a921bbe38bea19f6b581c8a56d5a8a41209e35',
      config = function() require('plugins.fugitive') end,
      cond = function() return not vim.g.vscode end,
      cmd = 'Git',
    }

    -- File Management
    use {
      'nvim-telescope/telescope.nvim',
      commit = 'b5833a682c511885887373aad76272ad70f7b3c2',
      cond = function() return vim.g.vscode end,
      config = function() require('plugins.telescope') end,
      requires = {
        {
          'gbrlsnchs/telescope-lsp-handlers.nvim',
          commit = 'd6d5983b0131ee2c386ca9e349f6621e12d971cb'
        },
        {
          'nvim-lua/plenary.nvim',
          commit = '986ad71ae930c7d96e812734540511b4ca838aa2'
        },
        {
          'nvim-telescope/telescope-ui-select.nvim',
          commit = '62ea5e58c7bbe191297b983a9e7e89420f581369'
        }
      }
    }

    use {
      'kyazdani42/nvim-tree.lua',
      commit = '451901ca9c4a0d97d7b7cb93276be7ed5588b3ab',
      requires = {
        {
          'kyazdani42/nvim-web-devicons',
          commit = '2d02a56189e2bde11edd4712fea16f08a6656944'
        }, -- optional, for file icon
      },
      config = function() require('plugins.nvimTree') end
    }

    -- LSP, Completion & Formatting

    use {
      'neovim/nvim-lspconfig',
      commit = 'df3be5006530ff73b57d6c302b4da7ed2b0e159d',
      cond = function() return not vim.g.vscode end,
      config = function() require('lsp.init') end,
    }

    use {
      'github/copilot.vim'
    }

    use {
      'hrsh7th/nvim-cmp',
      commit = '706371f1300e7c0acb98b346f80dad2dd9b5f679',
      config = function() require('plugins.cmp') end,
      cond = function() return not vim.g.vscode end,
      event = 'InsertEnter',
      requires = {
        {
          'hrsh7th/cmp-vsnip',
          commit = '0abfa1860f5e095a07c477da940cfcb0d273b700',
          after = 'nvim-cmp'
        },
        {
          'hrsh7th/vim-vsnip',
          commit = '8f199ef690ed26dcbb8973d9a6760d1332449ac9',
          after = 'nvim-cmp'
        },
        {
          'rafamadriz/friendly-snippets',
          commit = '1db69684a27eec0b9f520a5d7d95d414fc30ba91',
          after = 'nvim-cmp',
        },
        {
          'hrsh7th/cmp-buffer',
          commit = '62fc67a2b0205136bc3e312664624ba2ab4a9323',
          after = 'nvim-cmp',
        },
        {
          'hrsh7th/cmp-calc',
          commit = 'f7efc20768603bd9f9ae0ed073b1c129f63eb312',
          after = 'nvim-cmp',
        },
        {
          'hrsh7th/cmp-cmdline',
          commit = 'c36ca4bc1dedb12b4ba6546b96c43896fd6e7252',
          after = 'nvim-cmp',
        },
        {
          'hrsh7th/cmp-nvim-lsp',
          commit = 'affe808a5c56b71630f17aa7c38e15c59fd648a8',
          after = 'nvim-cmp',
        },
        {
          'hrsh7th/cmp-path',
          commit = '447c87cdd6e6d6a1d2488b1d43108bfa217f56e1',
          after = 'nvim-cmp',
        },
        {
          'onsails/lspkind-nvim',
          commit = '57e5b5dfbe991151b07d272a06e365a77cc3d0e7'
        }
      }
    }

    use {
      'mhartington/formatter.nvim',
      commit = 'bf7c0e4cf879e6eb7ca4f00184cb4b261fade952',
      config = function() require('plugins.formatter') end,
    }


    -- Syntax

    use {
      'nvim-treesitter/nvim-treesitter',
      commit = '22824614163c54ef5d366b15c8685e24d33763db',
      run = ':TSUpdate',
      config = function() require('plugins.treesitter') end,
    }

    use {
      'nvim-treesitter/playground',
      commit = 'ce7e4b757598f1c785ed0fd94fc65959acd7d39c',
      requires = 'nvim-treesitter/nvim-treesitter',
    }

    use {
      'kmyk/brainfuck-highlight.vim',
      commit = '8761da13ceb23ccc2b2678b5f05aba11104fcf32'
    }

    use {
      'lilydjwg/colorizer',
      commit = '72790a003d5a706c287486a1a81e3a6b32158b54'
    }

    -- Theming

    use {
      'embark-theme/vim',
      commit = '1dcf15351622964ab7e35f3e780e7a1c581ebd2d',
      as = 'embark',
      disabled = true,
    }

    use {
      'haishanh/night-owl.vim',
      commit = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
      cond = function() return not vim.g.vscode end,
      disabled = true,
    }

    use {
      'bluz71/vim-nightfly-guicolors',
      commit = '83f27e09df7c78d8d1a00c67ff53786d66c23568',
      cond = function() return not vim.g.vscode end,
      disabled = true,
    }

    use {
      'dracula/vim',
      commit = 'd7723a842a6cfa2f62cf85530ab66eb418521dc2',
      as = 'dracula',
      disabled = true,
    }

    use {
      'folke/tokyonight.nvim',
      commit = '8223c970677e4d88c9b6b6d81bda23daf11062bb',
      setup = function() require('plugins.themes.tokyonight') end,
      config = function() vim.cmd('colorscheme tokyonight') end,
    }

    use {
      'shaunsingh/moonlight.nvim',
      commit = 'e24e4218ec680b6396532808abf57ca0ada82e66',
      disabled = true,
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
      enable = false,
      threshold = 0
    }
  }
})
