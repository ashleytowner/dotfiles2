local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({
  function(use)

    use {
      'wbthomason/packer.nvim',
      commit = 'c576ab3f1488ee86d60fd340d01ade08dcabd256'
    }

    -- Util

    use {
      'dstein64/vim-startuptime',
      cmd = 'StartupTime',
      commit = '63967c60feb2034158bdbcf061c171e3bb4d8b99'
    }

    use {
      'mhinz/vim-startify',
      config = function() require('plugins.startify') end,
      commit = '81e36c352a8deea54df5ec1e2f4348685569bed2'
    }

    use {
      'akinsho/toggleterm.nvim',
      config = function() require('toggleterm').setup({
        direction = 'float',
        open_mapping = [[<C-\>]]
      }) end,
      commit = 'e97d0c1046512e975a9f3fa95afe98f312752b1c'
    }

    use {
      'glacambre/firenvim',
      run = function() vim.fn['firenvim#install'](0) end,
      config = function() require('plugins.firenvim') end,
      cond = function() return vim.g.started_by_firenvim end,
      commit = '668b350ce88cc9a2257644c67945c9abbdd36cb5'
    }


    -- Motions & Objects

    use {
      'tpope/vim-surround',
      config = function() require('plugins.vimSurround') end,
      commit = 'baf89ad26488f6a7665d51b986f5c7ad2d22b30b'
    }

    use {
      'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end,
      commit = '026ec9530b6691db8c68a3ae4fc44c56aa281f52'
    }

    use {
      'bkad/CamelCaseMotion',
      config = function() require('plugins.camelCaseMotions') end,
      commit = 'de439d7c06cffd0839a29045a103fe4b44b15cdc'
    }

    use {
      'phaazon/hop.nvim',
      config = function() require('plugins.hop') end,
      cond = function() return not vim.g.vscode end,
      commit = '75f73d3959a0df7ef3642fd5138acdb1ce50fdc8'
    }

    use {
      'windwp/nvim-autopairs',
      config = function() require('plugins.autopairs') end,
      after = {
        'nvim-cmp'
      },
      commit = 'd2cde7c5802b34d6391a8a3555a3b7b56482f2aa'
    }

    use {
      'mattn/emmet-vim',
      commit = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d'
    }

    -- Git

    use {
      'lewis6991/gitsigns.nvim',
      config = function() require('plugins.gitsigns') end,
      requires = {
        'nvim-lua/plenary.nvim'
      },
      commit = '779f4eb59047ef7faa41e71d261d041edfabfb39'
    }

    use {
      'tpope/vim-fugitive',
      config = function() require('plugins.fugitive') end,
      cond = function() return not vim.g.vscode end,
      cmd = 'Git',
      commit = 'afd6c13c6b77053c04d858bb5e2aa9235fb62024'
    }

    -- File Management
    use {
      'nvim-telescope/telescope.nvim',
      cond = function() return vim.g.vscode end,
      config = function() require('plugins.telescope') end,
      requires = {
        {
          'gbrlsnchs/telescope-lsp-handlers.nvim',
          commit = 'd6d5983b0131ee2c386ca9e349f6621e12d971cb'
        },
        {
          'nvim-lua/plenary.nvim',
          commit = '14dfb4071022b22e08384ee125a5607464b6d397'
        }
      },
      commit = '1daf0917cf859c3c089c62e960b128fe3382fc6d'
    }

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        {
          'kyazdani42/nvim-web-devicons',
          commit = '4415d1aaa56f73b9c05795af84d625c610b05d3b'
        }, -- optional, for file icon
      },
      config = function() require('plugins.nvimTree') end,
      commit = '08c57660a7761a507a3ae2f4a7c71fe30a412537'
    }

    -- LSP & Completion

    use {
      'neovim/nvim-lspconfig',
      cond = function() return not vim.g.vscode end,
      config = function() require('lsp.init') end,
      commit = '858fc0ec1ffa02fc03f0c62d646e8054007c49ad'
    }

    use {
      'hrsh7th/nvim-cmp',
      config = function() require('plugins.cmp') end,
      cond = function() return not vim.g.vscode end,
      event = 'InsertEnter',
      requires = {
        {
          'rafamadriz/friendly-snippets',
          after = 'nvim-cmp',
          commit = 'ad07b2844021b20797adda5b483265802559a693'
        },
        {
          'hrsh7th/cmp-buffer',
          after = 'nvim-cmp',
          commit = 'd66c4c2d376e5be99db68d2362cd94d250987525'
        },
        {
          'hrsh7th/cmp-calc',
          after = 'nvim-cmp',
          commit = 'eb7bd1d7382ac26d8eb7346e36405c0ae94333a2'
        },
        {
          'hrsh7th/cmp-cmdline',
          after = 'nvim-cmp',
          commit = 'f4beb74e8e036f9532bedbcac0b93c7a55a0f8b0'
        },
        {
          'hrsh7th/cmp-nvim-lsp',
          after = 'nvim-cmp',
          commit = 'ebdfc204afb87f15ce3d3d3f5df0b8181443b5ba'
        },
        {
          'hrsh7th/cmp-path',
          after = 'nvim-cmp',
          commit = '466b6b8270f7ba89abd59f402c73f63c7331ff6e'
        },
        {
          'onsails/lspkind-nvim',
          commit = '93e98a0c900327ce7e9be1cbf24aebbe7170e375'
        }
      },
      commit = '1001683bee3a52a7b7e07ba9d391472961739c7b'
    }


    -- Syntax

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function() require('plugins.treesitter') end,
      commit = '3aac7f9db9ee1973152426c097216e0071dd2293'
    }

    use {
      'nvim-treesitter/playground',
      requires = 'nvim-treesitter/nvim-treesitter',
      commit = '9df82a27a49e1c14e9d7416b537517a79d675086'
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
      as = 'embark',
      disabled = true,
      commit = '2740b2f15708dee3a5b390709e07a69255f75d75'
    }

    use {
      'haishanh/night-owl.vim',
      cond = function() return not vim.g.vscode end,
      disabled = true,
      commit = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7'
    }

    use {
      'bluz71/vim-nightfly-guicolors',
      cond = function() return not vim.g.vscode end,
      disabled = true,
      commit = '94bc49852c3f0b13afc7c55183625325c41a6e53'
    }

    use {
      'dracula/vim',
      as = 'dracula',
      disabled = true,
      commit = '210e0961b9bd765b5b46a84d0631271ee8e6af64'
    }

    use {
      'folke/tokyonight.nvim',
      setup = function() require('plugins.themes.tokyonight') end,
      config = function() vim.cmd('colorscheme tokyonight') end,
      commit = '8223c970677e4d88c9b6b6d81bda23daf11062bb'
    }

    use {
      'shaunsingh/moonlight.nvim',
      disabled = true,
      commit = 'e24e4218ec680b6396532808abf57ca0ada82e66'
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
