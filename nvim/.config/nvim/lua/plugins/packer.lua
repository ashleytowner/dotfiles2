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
  ['akinsho/toggleterm.nvim'] = '3ba683827c623affb4d9aa518e97b34db2623093',
  ['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
  ['catppuccin/nvim'] = '4393f2a67e672ccd9507758f72fdc33bc921055d',
  ['dracula/vim'] = 'b9f4f3a169266031d3744335595eee02a6e396c6',
  ['dstein64/vim-startuptime'] = '1acb5fa4aa29a24c36d559474b672cda9b9a9b6d',
  ['folke/tokyonight.nvim'] = '62b4e89ea1766baa3b5343ca77d62c817f5f48d0',
  ['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'd6d5983b0131ee2c386ca9e349f6621e12d971cb',
  ['github/copilot.vim'] = '5a411d19ce7334ab10ba12516743fc25dad363fa',
  ['glacambre/firenvim'] = '17a189f0f1e2d4197e00cd56dbeaed8c268bac8c',
  ['glepnir/dashboard-nvim'] = '5ccce7b50c8ce81c01956864ff51b455ee6933c4',
  ['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
  ['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
  ['hrsh7th/cmp-calc'] = '50792f34a628ea6eb31d2c90e8df174671e4e7a0',
  ['hrsh7th/cmp-cmdline'] = '8bc9c4a34b223888b7ffbe45c4fe39a7bee5b74d',
  ['hrsh7th/cmp-nvim-lsp'] = '59224771f91b86d1de12570b4070fe4ad7cd1eeb',
  ['hrsh7th/cmp-path'] = '91ff86cd9c29299a64f968ebb45846c485725f23',
  ['hrsh7th/cmp-vsnip'] = '989a8a73c44e926199bfd05fa7a516d51f2d2752',
  ['hrsh7th/nvim-cmp'] = '31a145c86642575cef6e6d78184da66ca57e2767',
  ['hrsh7th/vim-vsnip'] = '6f873418c4dc601d8ad019a5906eddff5088de9b',
  ['jayp0521/mason-null-ls.nvim'] = '1128f0d940cb2e93397d58a7177c866e8ca2f11f',
  ['jose-elias-alvarez/null-ls.nvim'] = 'c51978f546a86a653f4a492b86313f4616412cec',
  ['kyazdani42/nvim-tree.lua'] = '68a2a0971eb50f13e4d54498a2add73f131b9a85',
  ['kyazdani42/nvim-web-devicons'] = '3b1b794bc17b7ac3df3ae471f1c18f18d1a0f958',
  ['lewis6991/gitsigns.nvim'] = '9ff7dfb051e5104088ff80556203634fc8f8546d',
  ['lilydjwg/colorizer'] = '72790a003d5a706c287486a1a81e3a6b32158b54',
  ['lukas-reineke/indent-blankline.nvim'] = 'db7cbcb40cc00fc5d6074d7569fb37197705e7f6',
  ['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
  ['mbbill/undotree'] = 'bd60cb564e3c3220b35293679669bb77af5f389d',
  ['mfussenegger/nvim-dap'] = '61643680dcb771a29073cd432894e2f81a7c2ae3',
  ['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
  ['neovim/nvim-lspconfig'] = 'ea5744f9243ec25a178a0bc403a4c8203ecc4f23',
  ['numToStr/Comment.nvim'] = '5f01c1a89adafc52bf34e3bf690f80d9d726715d',
  ['nvim-lua/plenary.nvim'] = '4b7e52044bbb84242158d977a50c4cbcd85070c7',
  ['nvim-telescope/telescope.nvim'] = 'cea9c75c19d172d2c6f089f21656019734a615cf',
  ['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
  ['nvim-treesitter/nvim-treesitter'] = 'ace038e1e71e97069794740dbc6192b4cf091e87',
  ['nvim-treesitter/playground'] = '1290fdf6f2f0189eb3b4ce8073d3fda6a3658376',
  ['onsails/lspkind-nvim'] = 'c68b3a003483cf382428a43035079f78474cd11e',
  ['phaazon/hop.nvim'] = '90db1b2c61b820e230599a04fedcd2679e64bd07',
  ['rafamadriz/friendly-snippets'] = 'ef8caa5002e53977779ce8ab18a9c393ed624386',
  ['ThePrimeagen/refactoring.nvim'] = 'c9ca8e3bbf7218101f16e6a03b15bf72b99b2cae',
  ['tpope/vim-fugitive'] = '49cc58573e746d02024110d9af99e95994ea4b72',
  ['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
  ['tpope/vim-surround'] = '3d188ed2113431cf8dac77be61b842acb64433d9',
  ['wbthomason/packer.nvim'] = '6afb67460283f0e990d35d229fd38fdc04063e0a',
  ['williamboman/mason-lspconfig.nvim'] = 'edf15b98cd7d7ce0f83cf7d3a968145a3f974772',
  ['williamboman/mason.nvim'] = '0c5e610097590dd6f8254ae582c97088797855f9',
  ['windwp/nvim-autopairs'] = '5d75276fce887c0cf433bb1b9867717907211063',
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
