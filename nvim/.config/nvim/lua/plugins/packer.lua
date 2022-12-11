-- Boostrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local commits = {
  ['akinsho/toggleterm.nvim'] = 'b02a1674bd0010d7982b056fd3df4f717ff8a57a',
  ['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
  ['catppuccin/nvim'] = 'e7fbf2496ce0f1cdf9883a6b99d86afc2f3efadc',
  ['dracula/vim'] = '947e5298766f30bdb813749bf867913b29a06eac',
  ['dstein64/vim-startuptime'] = '1acb5fa4aa29a24c36d559474b672cda9b9a9b6d',
  ['folke/tokyonight.nvim'] = '0f7b6a5b6cf232f34cb8f51123a084a6eee96b89',
  ['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'd6d5983b0131ee2c386ca9e349f6621e12d971cb',
  ['github/copilot.vim'] = '2f4f9259a5c0f927b31c4256cd3e4d7c6df87662',
  ['glacambre/firenvim'] = '17a189f0f1e2d4197e00cd56dbeaed8c268bac8c',
  ['glepnir/dashboard-nvim'] = '5ccce7b50c8ce81c01956864ff51b455ee6933c4',
  ['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
  ['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
  ['hrsh7th/cmp-calc'] = '50792f34a628ea6eb31d2c90e8df174671e4e7a0',
  ['hrsh7th/cmp-cmdline'] = '23c51b2a3c00f6abc4e922dbd7c3b9aca6992063',
  ['hrsh7th/cmp-nvim-lsp'] = '59224771f91b86d1de12570b4070fe4ad7cd1eeb',
  ['hrsh7th/cmp-path'] = '91ff86cd9c29299a64f968ebb45846c485725f23',
  ['hrsh7th/cmp-vsnip'] = '989a8a73c44e926199bfd05fa7a516d51f2d2752',
  ['hrsh7th/nvim-cmp'] = '93f385c17611039f3cc35e1399f1c0a8cf82f1fb',
  ['hrsh7th/vim-vsnip'] = 'e44026b5394fd79aa0f2118aaf41627ef9c354ee',
  ['jayp0521/mason-null-ls.nvim'] = 'ab5d99619de2263508abb7fb05ef3a0f24a8d73d',
  ['jose-elias-alvarez/null-ls.nvim'] = 'adaa799264c92eea42d500c8b98e19caf32c14dc',
  ['kyazdani42/nvim-tree.lua'] = '8b4aaff783398ceb91abd97a7e85586657099218',
  ['kyazdani42/nvim-web-devicons'] = '05e1072f63f6c194ac6e867b567e6b437d3d4622',
  ['lewis6991/gitsigns.nvim'] = 'd076301a634198e0ae3efee3b298fc63c055a871',
  ['lilydjwg/colorizer'] = '72790a003d5a706c287486a1a81e3a6b32158b54',
  ['lukas-reineke/indent-blankline.nvim'] = 'c4c203c3e8a595bc333abaf168fcb10c13ed5fb7',
  ['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
  ['mbbill/undotree'] = '1a23ea84bd02c34f50d8e10a8b4bfc89597ffe4e',
  ['mfussenegger/nvim-dap'] = 'a8fd28aec46fe9f5dd42f8d5939217ce60787d73',
  ['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
  ['neovim/nvim-lspconfig'] = '6eb24ef9175d1fa3c7a23e115854b1a2d923d386',
  ['numToStr/Comment.nvim'] = '5f01c1a89adafc52bf34e3bf690f80d9d726715d',
  ['nvim-lua/plenary.nvim'] = '4b7e52044bbb84242158d977a50c4cbcd85070c7',
  ['nvim-telescope/telescope.nvim'] = 'cabf991b1d3996fa6f3232327fc649bbdf676496',
  ['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
  ['nvim-treesitter/nvim-treesitter'] = '619f1ace03860d668c7a661332c38480f2db2584',
  ['nvim-treesitter/playground'] = '1290fdf6f2f0189eb3b4ce8073d3fda6a3658376',
  ['onsails/lspkind-nvim'] = 'c68b3a003483cf382428a43035079f78474cd11e',
  ['phaazon/hop.nvim'] = '90db1b2c61b820e230599a04fedcd2679e64bd07',
  ['rafamadriz/friendly-snippets'] = '9b3e497cf0c3abcf73d791968a9768a22405fa13',
  ['ThePrimeagen/refactoring.nvim'] = 'c9ca8e3bbf7218101f16e6a03b15bf72b99b2cae',
  ['tpope/vim-fugitive'] = '5b0b138483de17a8fd8dfcec0b491782c8fbf102',
  ['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
  ['tpope/vim-surround'] = '3d188ed2113431cf8dac77be61b842acb64433d9',
  ['wbthomason/packer.nvim'] = '64ae65fea395d8dc461e3884688f340dd43950ba',
  ['williamboman/mason-lspconfig.nvim'] = 'e8bd50153b94cc5bbfe3f59fc10ec7c4902dd526',
  ['williamboman/mason.nvim'] = 'e8bf53119572622f9c45c82f4ef9443a4d37df4b',
  ['windwp/nvim-autopairs'] = '9fa996123031b4cad100bd5afad04384a622c8a7',
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
      config = function() require('refactoring').setup({}) end,
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-treesitter/nvim-treesitter'}
      }
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
      cond = function() return vim.g.started_by_firenvim end
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
      }
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
      }
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
      }
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
      }
    }

    use {
      'hrsh7th/nvim-cmp',
      commit = commits['hrsh7th/nvim-cmp'],
      config = function() require('plugins.config.cmp') end,
      event = 'InsertEnter',
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
      }
    }

    use {
      'github/copilot.vim',
      config = function() require('plugins.config.copilot') end,
      commit = commits['github/copilot.vim'],
      disable = true
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

    use {
      'lilydjwg/colorizer',
      commit = commits['lilydjwg/colorizer']
    }

    use {
      'lukas-reineke/indent-blankline.nvim',
      commit = commits['lukas-reineke/indent-blankline.nvim'],
      config = function() require('plugins.config.indent-blankline') end,
    }

    -- Theming

    use {
      'haishanh/night-owl.vim',
      commit = commits['haishanh/night-owl.vim']
    }

    use {
      'catppuccin/nvim',
      as = 'catppuccin',
      commit = commits['catppuccin/nvim'],
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
    compile_on_sync = true,
    profile = {
      enable = true,
      threshold = 0
    }
  }
})
