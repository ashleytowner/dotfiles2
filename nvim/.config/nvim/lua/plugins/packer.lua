local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local hashes = {
      ['wbthomason/packer.nvim'] = '6afb67460283f0e990d35d229fd38fdc04063e0a',
      ['nvim-lua/plenary.nvim'] = '4b66054e75356ac0b909bbfee9c682e703f535c2',
      ['williamboman/mason.nvim'] = '134c4d9ce64286fbbdce399346800e8f93fb06cd',
      ['williamboman/mason-lspconfig.nvim'] = 'b70dedab5ceb5f3f84c6bc9ceea013292a14f8dc',
      ['ThePrimeagen/refactoring.nvim'] = 'c9ca8e3bbf7218101f16e6a03b15bf72b99b2cae',
      ['dstein64/vim-startuptime'] = '0dcecdf0823d668e291dbd571d6bb9086584357f',
      ['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
      ['akinsho/toggleterm.nvim'] = 'a7c9a6fd135f96639e2ac686691a32db6d011471',
      ['glacambre/firenvim'] = '56a49d79904921a8b4405786e12b4e12fbbf171b',
      ['tpope/vim-surround'] = 'bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea',
      ['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
      ['numToStr/Comment.nvim'] = '30d23aa2e1ba204a74d5dfb99777e9acbe9dd2d6',
      ['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
      ['phaazon/hop.nvim'] = '2a1b686aad85a3c241f8cd8fd42eb09c7de5ed79',
      ['windwp/nvim-autopairs'] = '972a7977e759733dd6721af7bcda7a67e40c010e',
      ['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
      ['lewis6991/gitsigns.nvim'] = '231fa923fbc2797eef92b24860ab882cebf645b2',
      ['tpope/vim-fugitive'] = 'dd8107cabf5fe85df94d5eedcae52415e543f208',
      ['nvim-telescope/telescope.nvim'] = '2584ff391b528d01bf5e8c04206d5902a79ebdde',
      ['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'd6d5983b0131ee2c386ca9e349f6621e12d971cb',
      ['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
      ['kyazdani42/nvim-tree.lua'] = 'fb8735e96cecf004fbefb086ce85371d003c5129',
      ['kyazdani42/nvim-web-devicons'] = '2d02a56189e2bde11edd4712fea16f08a6656944',
      ['neovim/nvim-lspconfig'] = '51775b12cfbf1b6462c7b13cd020cc09e6767aea',
      ['hrsh7th/nvim-cmp'] = '913eb8599816b0b71fe959693080917d8063b26a',
      ['hrsh7th/cmp-vsnip'] = '0abfa1860f5e095a07c477da940cfcb0d273b700',
      ['hrsh7th/vim-vsnip'] = '8f199ef690ed26dcbb8973d9a6760d1332449ac9',
      ['rafamadriz/friendly-snippets'] = '22a99756492a340c161ab122b0ded90ab115a1b3',
      ['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
      ['hrsh7th/cmp-calc'] = 'f7efc20768603bd9f9ae0ed073b1c129f63eb312',
      ['hrsh7th/cmp-cmdline'] = 'c66c379915d68fb52ad5ad1195cdd4265a95ef1e',
      ['hrsh7th/cmp-nvim-lsp'] = 'affe808a5c56b71630f17aa7c38e15c59fd648a8',
      ['hrsh7th/cmp-path'] = '447c87cdd6e6d6a1d2488b1d43108bfa217f56e1',
      ['onsails/lspkind-nvim'] = 'f46e3b5528e73347dc0678277460e5cea2a52b6a',
      ['nvim-treesitter/nvim-treesitter'] = '088dfbc54abfefeab8d3f1efc8be1ea48888b320',
      ['nvim-treesitter/playground'] = 'bcfab84f98a33f2ad34dda6c842046dca70aabf6',
      ['lilydjwg/colorizer'] = '72790a003d5a706c287486a1a81e3a6b32158b54',
      ['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
      ['dracula/vim'] = 'd7723a842a6cfa2f62cf85530ab66eb418521dc2',
      ['folke/tokyonight.nvim'] = '3e79e043dfdc31b320d61432eae2eefc26478965',
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
      cmd = 'Git',
    }

    -- File Management
    use {
      'nvim-telescope/telescope.nvim',
      commit = hashes['nvim-telescope/telescope.nvim'],
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
      config = function() require('lsp.init') end,
    }

    use {
      'hrsh7th/nvim-cmp',
      commit = hashes['hrsh7th/nvim-cmp'],
      config = function() require('plugins.cmp') end,
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
      config = function() require('plugins.themes.colorscheme') end
    }

    use {
      'dracula/vim',
      commit = hashes['dracula/vim'],
      as = 'dracula',
      config = function() require('plugins.themes.colorscheme') end
    }

    use {
      'folke/tokyonight.nvim',
      commit = hashes['folke/tokyonight.nvim'],
      config = function() require('plugins.themes.colorscheme') end
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
