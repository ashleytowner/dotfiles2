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
  ['nvim-lua/plenary.nvim'] = '4b7e52044bbb84242158d977a50c4cbcd85070c7',
  ['williamboman/mason.nvim'] = 'bf170f8379a3eaeed662f2c8e42dced96e78f429',
  ['williamboman/mason-lspconfig.nvim'] = '6768067573d97a033824b38bdce18ae0c8490a52',
  ['ThePrimeagen/refactoring.nvim'] = 'c9ca8e3bbf7218101f16e6a03b15bf72b99b2cae',
  ['dstein64/vim-startuptime'] = 'fcfa65f98046248ba2ec88ebab756b6d4e42bbc2',
  ['mhinz/vim-startify'] = '81e36c352a8deea54df5ec1e2f4348685569bed2',
  ['akinsho/toggleterm.nvim'] = '8f302c9a05ff53fc3f891cbf09c5f959b10392a3',
  ['glacambre/firenvim'] = '2f0ee858c3eb5c9d306523cc054047eda2e6a3a2',
  ['tpope/vim-surround'] = '3d188ed2113431cf8dac77be61b842acb64433d9',
  ['tpope/vim-repeat'] = '24afe922e6a05891756ecf331f39a1f6743d3d5a',
  ['numToStr/Comment.nvim'] = 'ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6',
  ['bkad/CamelCaseMotion'] = 'de439d7c06cffd0839a29045a103fe4b44b15cdc',
  ['phaazon/hop.nvim'] = '6591b3656b75ff313cc38dc662a7ee8f75f1c165',
  ['windwp/nvim-autopairs'] = '6b6e35fc9aca1030a74cc022220bc22ea6c5daf4',
  ['mattn/emmet-vim'] = 'def5d57a1ae5afb1b96ebe83c4652d1c03640f4d',
  ['lewis6991/gitsigns.nvim'] = '851cd32caaea84f303c4fdf51d72dfa5fcd795bb',
  ['tpope/vim-fugitive'] = 'dd8107cabf5fe85df94d5eedcae52415e543f208',
  ['nvim-telescope/telescope.nvim'] = '97847309cbffbb33e442f07b8877d20322a26922',
  ['gbrlsnchs/telescope-lsp-handlers.nvim'] = 'd6d5983b0131ee2c386ca9e349f6621e12d971cb',
  ['nvim-telescope/telescope-ui-select.nvim'] = '62ea5e58c7bbe191297b983a9e7e89420f581369',
  ['kyazdani42/nvim-tree.lua'] = '1be1e17be5841274253fb445f1b5db90bade7539',
  ['kyazdani42/nvim-web-devicons'] = '9061e2d355ecaa2b588b71a35e7a11358a7e51e1',
  ['neovim/nvim-lspconfig'] = '2315a397fd5057e3a74a09a240f606af28447ebf',
  ['hrsh7th/nvim-cmp'] = 'cdb77665bbf23bd2717d424ddf4bf98057c30bb3',
  ['hrsh7th/cmp-vsnip'] = '1ae05c6c867d9ad44bce811056e861e0d5c531cb',
  ['hrsh7th/vim-vsnip'] = '03010115eb8bdda00ce5f845cc2f7025700e33bb',
  ['rafamadriz/friendly-snippets'] = 'bb318c455e4e8946d64c79753f5bb07f7c27d711',
  ['hrsh7th/cmp-buffer'] = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
  ['hrsh7th/cmp-calc'] = 'f7efc20768603bd9f9ae0ed073b1c129f63eb312',
  ['hrsh7th/cmp-cmdline'] = 'c66c379915d68fb52ad5ad1195cdd4265a95ef1e',
  ['hrsh7th/cmp-nvim-lsp'] = '3cf38d9c957e95c397b66f91967758b31be4abe6',
  ['hrsh7th/cmp-path'] = '91ff86cd9c29299a64f968ebb45846c485725f23',
  ['onsails/lspkind-nvim'] = 'c68b3a003483cf382428a43035079f78474cd11e',
  ['nvim-treesitter/nvim-treesitter'] = 'c155b6bb308269ca4a376777a8621261efbd17cb',
  ['nvim-treesitter/playground'] = 'e6a0bfaf9b5e36e3a327a1ae9a44a989eae472cf',
  ['lilydjwg/colorizer'] = '72790a003d5a706c287486a1a81e3a6b32158b54',
  ['haishanh/night-owl.vim'] = '783a41a27f7fe55ed91d1ec0f0351d06ae17fbc7',
  ['dracula/vim'] = '7ebadce59c087f441b7baacff68e1667386d119a',
  ['folke/tokyonight.nvim'] = '8756c99d08f3605534600e70f9fae64035a287dc',
  ['mfussenegger/nvim-dap'] = '3d0d7312bb2a8491eb2927504e5cfa6e81b66de4',
  ['mbbill/undotree'] = 'bd60cb564e3c3220b35293679669bb77af5f389d',
  ['lukas-reineke/indent-blankline.nvim'] = 'db7cbcb40cc00fc5d6074d7569fb37197705e7f6',
  ['glepnir/dashboard-nvim'] = 'bd7163f56ac715a6d687737ea144731ac6ce8478',
  ['catppuccin/nvim'] = 'e695645298320e9714d10897aadee3cb5951567a',
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
      commit = commits['glepnir/dashboard-nvim'],
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

    use {
      'lukas-reineke/indent-blankline.nvim',
      commit = commits['lukas-reineke/indent-blankline.nvim'],
      config = function()
        require('indent_blankline').setup({
          show_current_context = true
        })
      end
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
      config = function()
        vim.g.catppuccin_flavour = "macchiato"
        require('catppuccin').setup()
        vim.cmd [[colorscheme catppuccin]]
      end
    }

    use {
      'dracula/vim',
      commit = commits['dracula/vim'],
      as = 'dracula',
    }

    use {
      'folke/tokyonight.nvim',
      commit = commits['folke/tokyonight.nvim'],
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
