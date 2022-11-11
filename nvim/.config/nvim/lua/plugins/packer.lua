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
  ['catppuccin/nvim'] = 'cd676faa020b34e6617398835b5fa3d1c2e8895c',
  ['dracula/vim'] = 'b9f4f3a169266031d3744335595eee02a6e396c6',
  ['dstein64/vim-startuptime'] = 'a1e294454128062236d758cdaefee66664051a6c',
  ['folke/tokyonight.nvim'] = 'a6d34b4e6df02e5b90a787d16d6d445d39546acb',
  ['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'd6d5983b0131ee2c386ca9e349f6621e12d971cb',
  ['github/copilot.vim'] = '5a411d19ce7334ab10ba12516743fc25dad363fa',
  ['glacambre/firenvim'] = '17a189f0f1e2d4197e00cd56dbeaed8c268bac8c',
  ['glepnir/dashboard-nvim'] = '1aab263f4773106abecae06e684f762d20ef587e',
  ['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
  ['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
  ['hrsh7th/cmp-calc'] = 'f7efc20768603bd9f9ae0ed073b1c129f63eb312',
  ['hrsh7th/cmp-cmdline'] = 'c66c379915d68fb52ad5ad1195cdd4265a95ef1e',
  ['hrsh7th/cmp-nvim-lsp'] = '78924d1d677b29b3d1fe429864185341724ee5a2',
  ['hrsh7th/cmp-path'] = '91ff86cd9c29299a64f968ebb45846c485725f23',
  ['hrsh7th/cmp-vsnip'] = '1ae05c6c867d9ad44bce811056e861e0d5c531cb',
  ['hrsh7th/nvim-cmp'] = 'c37ea78941b93ef6b6bdd8274649ea8a0ce4f87a',
  ['hrsh7th/vim-vsnip'] = 'ceeee48145d27f0b3986ab6f75f52a2449974603',
  ['jayp0521/mason-null-ls.nvim'] = '2958e76f284684146ac04da9361da431afc0e7cf',
  ['jose-elias-alvarez/null-ls.nvim'] = '07d4ed4c6b561914aafd787453a685598bec510f',
  ['kyazdani42/nvim-tree.lua'] = '7e892767bdd9660b7880cf3627d454cfbc701e9b',
  ['kyazdani42/nvim-web-devicons'] = '520776f30a3b39ed56402bffbdae57549e778b40',
  ['lewis6991/gitsigns.nvim'] = '9ff7dfb051e5104088ff80556203634fc8f8546d',
  ['lilydjwg/colorizer'] = '72790a003d5a706c287486a1a81e3a6b32158b54',
  ['lukas-reineke/indent-blankline.nvim'] = 'db7cbcb40cc00fc5d6074d7569fb37197705e7f6',
  ['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
  ['mbbill/undotree'] = 'bd60cb564e3c3220b35293679669bb77af5f389d',
  ['mfussenegger/nvim-dap'] = '61643680dcb771a29073cd432894e2f81a7c2ae3',
  ['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
  ['neovim/nvim-lspconfig'] = 'c96ec574eacfff8ad8dd4bdb6e96a1b3dbd268fd',
  ['numToStr/Comment.nvim'] = 'ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6',
  ['nvim-lua/plenary.nvim'] = '4b7e52044bbb84242158d977a50c4cbcd85070c7',
  ['nvim-telescope/telescope.nvim'] = 'cc77713294892c5bbce26adee665114250624e6b',
  ['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
  ['nvim-treesitter/nvim-treesitter'] = '1942f3554184e9d9dfb90dcc6542047b8f6511f2',
  ['nvim-treesitter/playground'] = 'e6a0bfaf9b5e36e3a327a1ae9a44a989eae472cf',
  ['onsails/lspkind-nvim'] = 'c68b3a003483cf382428a43035079f78474cd11e',
  ['phaazon/hop.nvim'] = '90db1b2c61b820e230599a04fedcd2679e64bd07',
  ['rafamadriz/friendly-snippets'] = 'c93311fbcc840210a2c0db574177d84a35a2c9c1',
  ['ThePrimeagen/refactoring.nvim'] = 'c9ca8e3bbf7218101f16e6a03b15bf72b99b2cae',
  ['tpope/vim-fugitive'] = '01f3e0af928857128eec8d998948b80ed1678c18',
  ['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
  ['tpope/vim-surround'] = '3d188ed2113431cf8dac77be61b842acb64433d9',
  ['wbthomason/packer.nvim'] = '6afb67460283f0e990d35d229fd38fdc04063e0a',
  ['williamboman/mason-lspconfig.nvim'] = 'a910b4d50f7a32d2f9057d636418a16843094b7c',
  ['williamboman/mason.nvim'] = 'd85d71e910d1b2c539d17ae0d47dad48f8f3c8a7',
  ['windwp/nvim-autopairs'] = '6b6e35fc9aca1030a74cc022220bc22ea6c5daf4',
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
      commit = commits['github/copilot.vim']
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
