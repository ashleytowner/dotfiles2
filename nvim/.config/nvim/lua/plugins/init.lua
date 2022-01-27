require('bootstrapPacker')
require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end}
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
    use 'nvim-telescope/telescope.nvim'
    use 'preservim/nerdtree'

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
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground', requires = 'nvim-treesitter/nvim-treesitter' }

    -- Theming
    use 'Iron-E/nvim-highlite'
    use { 'dracula/vim', as = 'dracula' }
    use { 'embark-theme/vim', as = 'embark' }
    use 'haishanh/night-owl.vim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'folke/tokyonight.nvim'

end)

require('Comment').setup()
require('plugins.camelCaseMotions')
require('plugins.coloresque')
require('plugins.firenvim')
require('plugins.fugitive')
require('plugins.hop')
require('plugins.nerdtree')
require('plugins.telescope')
require('plugins.themes.tokyonight')
require('plugins.treesitter')
