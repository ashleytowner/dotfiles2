local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({
  function(use)

    use 'wbthomason/packer.nvim'

    -- Util

    use {
      'dstein64/vim-startuptime',
      cmd = 'StartupTime'
    }

    use 'nvim-lua/plenary.nvim'

    use {
        'mhinz/vim-startify',
        config = function() require('plugins.startify') end,
    }

    use {
        'akinsho/toggleterm.nvim',
        config = function() require('toggleterm').setup({
          direction = 'float',
          open_mapping = [[<C-\>]]
        }) end,
        event = 'VimEnter'
    }

    use {
        'nvim-lua/popup.nvim',
        cond = function() return not vim.g.vscode end
    }

    use {
      'glacambre/firenvim',
      run = function() vim.fn['firenvim#install'](0) end,
      config = function() require('plugins.firenvim') end,
      cond = function() return vim.g.started_by_firenvim end
    }


    -- Motions & Objects

    use {
      'tpope/vim-surround',
      config = function() require('plugins.vimSurround') end,
      event = 'VimEnter'
    }

    use {
      'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end,
      event = 'VimEnter'
    }

    use {
      'bkad/CamelCaseMotion',
      config = function() require('plugins.camelCaseMotions') end,
      event = 'VimEnter'
    }

    use {
      'phaazon/hop.nvim',
      config = function() require('plugins.hop') end,
      cond = function() return not vim.g.vscode end,
      event = 'VimEnter'
    }

    use {
      'windwp/nvim-autopairs',
      config = function() require('plugins.autopairs') end,
      after = {
        'nvim-cmp'
      }
    }

    use 'mattn/emmet-vim'

    -- Git

    use {
      'lewis6991/gitsigns.nvim',
      config = function() require('plugins.gitsigns') end,
      event = 'VimEnter'
    }

    use {
      'tpope/vim-fugitive',
      config = function() require('plugins.fugitive') end,
      cond = function() return not vim.g.vscode end,
      cmd = 'Git'
    }

    -- File Management

    use {
      'nvim-telescope/telescope.nvim',
      cond = function() return vim.g.vscode end,
      config = function() require('plugins.telescope') end,
      event = 'VimEnter'
    }

    use {
      'gbrlsnchs/telescope-lsp-handlers.nvim',
       requires = 'nvim-telescope/telescope.nvim'
    }

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require('plugins.nvimTree') end
    }

    -- LSP & Completion

    use 'hrsh7th/cmp-buffer'

    use 'hrsh7th/cmp-calc'

    use 'hrsh7th/cmp-cmdline'

    use 'hrsh7th/cmp-nvim-lsp'

    use 'hrsh7th/cmp-path'

    use 'saadparwaiz1/cmp_luasnip'

    use {
      'neovim/nvim-lspconfig',
      cond = function() return not vim.g.vscode end,
      config = function() require('lsp.init') end
    }

    use {
      'L3MON4D3/LuaSnip',
      config = function() require('luasnip.loaders.from_vscode').load() end
    }

    use 'onsails/lspkind-nvim'

    use {
      'hrsh7th/nvim-cmp',
      config = function() require('plugins.cmp') end,
      cond = function() return not vim.g.vscode end,
      requires = {
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets'
      },
      after = {
        'cmp-buffer',
        'cmp-calc',
        'cmp-cmdline',
        'cmp-nvim-lsp',
        'cmp-path',
        'cmp_luasnip'
      }
    }


    -- Syntax

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function() require('plugins.treesitter') end
    }

    use {
      'nvim-treesitter/playground',
      requires = 'nvim-treesitter/nvim-treesitter'
    }

    use 'kmyk/brainfuck-highlight.vim'

    use {
      'ObserverOfTime/coloresque.vim',
      config = function() require('plugins.coloresque') end,
      event = 'VimEnter'
    }

    -- Theming

    use {
      'Iron-E/nvim-highlite',
      cond = function() return not vim.g.vscode end
    }

    use { 'embark-theme/vim', as = 'embark' }

    use {
      'haishanh/night-owl.vim',
      cond = function() return not vim.g.vscode end,
    }

    use {
      'bluz71/vim-nightfly-guicolors',
      cond = function() return not vim.g.vscode end
    }

    use {
      'dracula/vim',
      as = 'dracula'
    }

    use {
      'folke/tokyonight.nvim',
      setup = function() require('plugins.themes.tokyonight') end,
      config = function() vim.cmd('colorscheme tokyonight') end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if Packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    compile_on_sync = true
  }
})
