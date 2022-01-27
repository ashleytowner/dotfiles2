require('bootstrapPacker')
require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    use 'ObserverOfTime/coloresque.vim'

    -- Motions & Objects
    use 'justinmk/vim-sneak'
    use 'tpope/vim-surround'
    use 'numToStr/Comment.nvim'
    use 'bkad/CamelCaseMotion'
    use 'phaazon/hop.nvim'

    -- Git
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'

    -- File Management
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'preservim/nerdtree'

    -- LSP & Completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-calc'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'kmyk/brainfuck-highlight.vim'
    use 'mattn/emmet-vim'
    use 'onsails/lspkind-nvim'

    -- Syntax
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'

    -- Theming
    use 'Iron-E/nvim-highlite'
    use { 'dracula/vim', as = 'dracula' }
    use { 'embark-theme/vim', as = 'embark' }
    use 'haishanh/night-owl.vim'
    use 'marko-cerovac/material.nvim'
    use 'morhetz/gruvbox'
    use 'bluz71/vim-nightfly-guicolors'
    use 'folke/tokyonight.nvim'

end)

require('Comment').setup()
require('hop').setup()

require('plugins.treesitter')
require('plugins.telescope')
require('plugins.nerdtree')
require('plugins.firenvim')
require('plugins.coloresque')
require('plugins.themes')
