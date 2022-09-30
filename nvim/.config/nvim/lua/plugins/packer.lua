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
  ['wbthomason/packer.nvim'] = '6afb67460283f0e990d35d229fd38fdc04063e0a',
  ['nvim-lua/plenary.nvim'] = '9e7c62856e47053ec7b17f82c5da0f1e678d92c8',
  ['williamboman/mason.nvim'] = 'b8781bb2afcdabfaeab3be3829c3bfa2e3b89cc2',
  ['williamboman/mason-lspconfig.nvim'] = '0051870dd728f4988110a1b2d47f4a4510213e31',
  ['ThePrimeagen/refactoring.nvim'] = 'c9ca8e3bbf7218101f16e6a03b15bf72b99b2cae',
  ['dstein64/vim-startuptime'] = '1a5fe7b6275d8f62647969012dcd5bcceb2cebc6',
  ['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
  ['akinsho/toggleterm.nvim'] = '2a787c426ef00cb3488c11b14f5dcf892bbd0bda',
  ['glacambre/firenvim'] = '56a49d79904921a8b4405786e12b4e12fbbf171b',
  ['tpope/vim-surround'] = 'bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea',
  ['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
  ['numToStr/Comment.nvim'] = 'f3609253db3562d0c0d80194c7f457d3de99523f',
  ['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
  ['phaazon/hop.nvim'] = '2a1b686aad85a3c241f8cd8fd42eb09c7de5ed79',
  ['windwp/nvim-autopairs'] = '14cc2a4fc6243152ba085cc2059834113496c60a',
  ['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
  ['lewis6991/gitsigns.nvim'] = 'f98c85e7c3d65a51f45863a34feb4849c82f240f',
  ['tpope/vim-fugitive'] = 'dd8107cabf5fe85df94d5eedcae52415e543f208',
  ['nvim-telescope/telescope.nvim'] = 'd4204618dddf1628e7a19ad4a7b910864d1120a5',
  ['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'd6d5983b0131ee2c386ca9e349f6621e12d971cb',
  ['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
  ['kyazdani42/nvim-tree.lua'] = '43fd13854423666c53439536892a5fbc4a66044c',
  ['kyazdani42/nvim-web-devicons'] = '503418a130423f59e57027fd7db8bcee007d29d1',
  ['neovim/nvim-lspconfig'] = 'ad35a8cfa5086451e33af477a02bffa916dbe0ce',
  ['hrsh7th/nvim-cmp'] = '2427d06b6508489547cd30b6e86b1c75df363411',
  ['hrsh7th/cmp-vsnip'] = '0abfa1860f5e095a07c477da940cfcb0d273b700',
  ['hrsh7th/vim-vsnip'] = '8f199ef690ed26dcbb8973d9a6760d1332449ac9',
  ['rafamadriz/friendly-snippets'] = '2be79d8a9b03d4175ba6b3d14b082680de1b31b1',
  ['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
  ['hrsh7th/cmp-calc'] = 'f7efc20768603bd9f9ae0ed073b1c129f63eb312',
  ['hrsh7th/cmp-cmdline'] = 'c66c379915d68fb52ad5ad1195cdd4265a95ef1e',
  ['hrsh7th/cmp-nvim-lsp'] = 'affe808a5c56b71630f17aa7c38e15c59fd648a8',
  ['hrsh7th/cmp-path'] = '447c87cdd6e6d6a1d2488b1d43108bfa217f56e1',
  ['onsails/lspkind-nvim'] = 'c68b3a003483cf382428a43035079f78474cd11e',
  ['nvim-treesitter/nvim-treesitter'] = '9bfaf62e42bdcd042df1230e9188487e62a112c0',
  ['nvim-treesitter/playground'] = 'e6a0bfaf9b5e36e3a327a1ae9a44a989eae472cf',
  ['lilydjwg/colorizer'] = '72790a003d5a706c287486a1a81e3a6b32158b54',
  ['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
  ['dracula/vim'] = 'd7723a842a6cfa2f62cf85530ab66eb418521dc2',
  ['folke/tokyonight.nvim'] = 'a74cb93b1563ff1cf78a5c08b5dededa51f9372c',
  ['mfussenegger/nvim-dap'] = 'cf94cfb61da4b117153641a8a131e2f4ec8ec10b',
  ['mbbill/undotree'] = 'bf76bf2d1a097cda024699738286fa81fb6529ac',
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
      config = function() require('mason').setup() end
    }

    use {
      'williamboman/mason-lspconfig.nvim',
      commit = commits['williamboman/mason-lspconfig.nvim'],
      config = function() require('plugins.masonlsp') end,
      after = { 'nvim-lspconfig' },
      require = { 'nvim-lspconfig' }
    }

    use {
      'glepnir/dashboard-nvim',
      config = function()
        require('plugins.dashboard')
      end
    }

    use {
      'mfussenegger/nvim-dap',
      commit = commits['mfussenegger/nvim-dap'],
      config = function() require('plugins.dap') end
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
      config = function() require('toggleterm').setup({
        open_mapping = [[<C-\>]]
      }) end
    }

    use {
      'glacambre/firenvim',
      commit = commits['glacambre/firenvim'],
      run = function() vim.fn['firenvim#install'](0) end,
      config = function() require('plugins.firenvim') end,
      cond = function() return vim.g.started_by_firenvim end
    }


    -- Motions & Objects

    use {
      'tpope/vim-surround',
      commit = commits['tpope/vim-surround'],
      config = function() require('plugins.vimSurround') end,
      requires = {
        'tpope/vim-repeat',
        commit = commits['tpope/vim-repeat']
      }
    }

    use {
      'numToStr/Comment.nvim',
      commit = commits['numToStr/Comment.nvim'],
      config = function() require('Comment').setup({}) end,
    }

    use {
      'bkad/CamelCaseMotion',
      commit = commits['bkad/CamelCaseMotion'],
      config = function() require('plugins.camelCaseMotions') end,
    }

    use {
      'phaazon/hop.nvim',
      commit = commits['phaazon/hop.nvim'],
      config = function() require('plugins.hop') end,
    }

    use {
      'windwp/nvim-autopairs',
      commit = commits['windwp/nvim-autopairs'],
      config = function() require('plugins.autopairs') end,
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
      config = function() require('plugins.gitsigns') end,
      requires = {
        'nvim-lua/plenary.nvim',
        commit = commits['nvim-lua/plenary.nvim']
      },
    }

    use {
      'tpope/vim-fugitive',
      commit = commits['tpope/vim-fugitive'],
      config = function() require('plugins.fugitive') end,
      cmd = 'Git',
    }

    -- File Management
    use {
      'nvim-telescope/telescope.nvim',
      commit = commits['nvim-telescope/telescope.nvim'],
      config = function() require('plugins.telescope') end,
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
        }, -- optional, for file icon
      },
      config = function() require('plugins.nvimTree') end
    }

    use {
      'mbbill/undotree',
      commit = commits['mbbill/undotree'],
      config = function()
        vim.keymap.set('n', '<leader>u', '<CMD>UndotreeToggle<CR>')
      end
    }

    -- LSP, Completion & Formatting

    use {
      'neovim/nvim-lspconfig',
      commit = commits['neovim/nvim-lspconfig'],
      config = function() require('lsp.init') end,
    }

    use {
      'hrsh7th/nvim-cmp',
      commit = commits['hrsh7th/nvim-cmp'],
      config = function() require('plugins.cmp') end,
      event = 'InsertEnter',
      requires = {
        {
          'hrsh7th/vim-vsnip',
          commit = commits['hrsh7th/vim-vsnip'],
          after = 'nvim-cmp',
          config = function()
            vim.cmd([[
              imap <expr> <C-l> vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<C-l>'
              smap <expr> <C-l> vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<C-l>'
              imap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<C-h>'
              smap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<C-h>'
            ]])
          end
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

    -- Syntax

    use {
      'nvim-treesitter/nvim-treesitter',
      commit = commits['nvim-treesitter/nvim-treesitter'],
      run = ':TSUpdate',
      config = function() require('plugins.treesitter') end,
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

    -- Theming

    use {
      'haishanh/night-owl.vim',
      commit = commits['haishanh/night-owl.vim'],
      config = function() require('plugins.themes.colorscheme') end
    }

    use {
      'dracula/vim',
      commit = commits['dracula/vim'],
      as = 'dracula',
      config = function() require('plugins.themes.colorscheme') end
    }

    use {
      'folke/tokyonight.nvim',
      commit = commits['folke/tokyonight.nvim'],
      config = function() require('plugins.themes.colorscheme') end
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
      enable = false,
      threshold = 0
    }
  }
})
