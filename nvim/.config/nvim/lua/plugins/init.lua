require('bootstrapPacker')
require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    use { 'glacambre/firenvim',
          run = function() vim.fn['firenvim#install'](0) end,
          config = function() require('plugins.firenvim') end
        }
    use { 'ObserverOfTime/coloresque.vim',
          config = function() require('plugins.coloresque') end
        }

    -- Motions & Objects
    use 'justinmk/vim-sneak'
    use 'tpope/vim-surround'
    use { 'numToStr/Comment.nvim',
          config = function() require('Comment').setup() end
        }
    use { 'bkad/CamelCaseMotion',
          config = function() require('plugins.camelCaseMotions') end
        }
    use { 'phaazon/hop.nvim',
          config = function() require('plugins.hop') end
        }

    -- Git
    use 'airblade/vim-gitgutter'
    use { 'tpope/vim-fugitive',
          config = function() require('plugins.fugitive') end
        }

    -- File Management
    use { 'nvim-telescope/telescope.nvim',
          config = function() require('plugins.telescope') end
        }
    use { 'gbrlsnchs/telescope-lsp-handlers.nvim', requires = 'nvim-telescope/telescope.nvim' }
    use { 'preservim/nerdtree',
          config = function() require('plugins.nerdtree') end
        }

    -- LSP & Completion
    use { 'hrsh7th/cmp-buffer', requires = 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-calc', requires = 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-cmdline', requires = 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp', requires = 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-path', requires = 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/nvim-cmp', requires = 'neovim/nvim-lspconfig' }
    use 'neovim/nvim-lspconfig'

    use 'L3MON4D3/LuaSnip'
    use { 'saadparwaiz1/cmp_luasnip', requires = { 'hrsh7th/nvim-cmp', 'L3MON4D3/LuaSnip' } }
    use 'kmyk/brainfuck-highlight.vim'
    use 'mattn/emmet-vim'
    use 'onsails/lspkind-nvim'

    -- Syntax
    use { 'nvim-treesitter/nvim-treesitter',
          run = ':TSUpdate',
          config = function() require('plugins.treesitter') end
        }
    use { 'nvim-treesitter/playground', requires = 'nvim-treesitter/nvim-treesitter' }

    -- Theming
    use 'Iron-E/nvim-highlite'
    use { 'dracula/vim', as = 'dracula' }
    use { 'embark-theme/vim', as = 'embark' }
    use 'haishanh/night-owl.vim'
    use 'bluz71/vim-nightfly-guicolors'
    use { 'folke/tokyonight.nvim',
          setup = function() require('plugins.themes.tokyonight') end,
          config = function() vim.cmd('colorscheme tokyonight') end
        }

end)

