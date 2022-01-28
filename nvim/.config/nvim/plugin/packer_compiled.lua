-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ashley.towner/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ashley.towner/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ashley.towner/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ashley.towner/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ashley.towner/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  CamelCaseMotion = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.camelCaseMotions\frequire\0" },
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/CamelCaseMotion",
    url = "https://github.com/bkad/CamelCaseMotion"
  },
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["brainfuck-highlight.vim"] = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/brainfuck-highlight.vim",
    url = "https://github.com/kmyk/brainfuck-highlight.vim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["coloresque.vim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.coloresque\frequire\0" },
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/coloresque.vim",
    url = "https://github.com/ObserverOfTime/coloresque.vim"
  },
  dracula = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/dracula",
    url = "https://github.com/dracula/vim"
  },
  embark = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/embark",
    url = "https://github.com/embark-theme/vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  firenvim = {
    cond = { "\27LJ\2\n1\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0L\0\2\0\24started_by_firenvim\6g\bvim\0" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.firenvim\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["hop.nvim"] = {
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.hop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  nerdtree = {
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.nerdtree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["night-owl.vim"] = {
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/night-owl.vim",
    url = "https://github.com/haishanh/night-owl.vim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-highlite"] = {
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/nvim-highlite",
    url = "https://github.com/Iron-E/nvim-highlite"
  },
  ["nvim-lspconfig"] = {
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rlsp.init\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-lsp-handlers.nvim"] = {
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/telescope-lsp-handlers.nvim",
    url = "https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim"
  },
  ["telescope.nvim"] = {
    cond = { "\27LJ\2\n$\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-fugitive"] = {
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.fugitive\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-nightfly-guicolors"] = {
    cond = { "\27LJ\2\n(\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/opt/vim-nightfly-guicolors",
    url = "https://github.com/bluz71/vim-nightfly-guicolors"
  },
  ["vim-surround"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.vimSurround\frequire\0" },
    loaded = true,
    path = "/home/ashley.towner/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: tokyonight.nvim
time([[Setup for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.themes.tokyonight\frequire\0", "setup", "tokyonight.nvim")
time([[Setup for tokyonight.nvim]], false)
time([[packadd for tokyonight.nvim]], true)
vim.cmd [[packadd tokyonight.nvim]]
time([[packadd for tokyonight.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: coloresque.vim
time([[Config for coloresque.vim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.coloresque\frequire\0", "config", "coloresque.vim")
time([[Config for coloresque.vim]], false)
-- Config for: CamelCaseMotion
time([[Config for CamelCaseMotion]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.camelCaseMotions\frequire\0", "config", "CamelCaseMotion")
time([[Config for CamelCaseMotion]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: vim-surround
time([[Config for vim-surround]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.vimSurround\frequire\0", "config", "vim-surround")
time([[Config for vim-surround]], false)
-- Conditional loads
time([[Conditional loading of telescope.nvim]], true)
  require("packer.load")({"telescope.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of telescope.nvim]], false)
time([[Conditional loading of vim-fugitive]], true)
  require("packer.load")({"vim-fugitive"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-fugitive]], false)
time([[Conditional loading of vim-gitgutter]], true)
  require("packer.load")({"vim-gitgutter"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-gitgutter]], false)
time([[Conditional loading of vim-nightfly-guicolors]], true)
  require("packer.load")({"vim-nightfly-guicolors"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-nightfly-guicolors]], false)
time([[Conditional loading of hop.nvim]], true)
  require("packer.load")({"hop.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of hop.nvim]], false)
time([[Conditional loading of nerdtree]], true)
  require("packer.load")({"nerdtree"}, {}, _G.packer_plugins)
time([[Conditional loading of nerdtree]], false)
time([[Conditional loading of nvim-highlite]], true)
  require("packer.load")({"nvim-highlite"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-highlite]], false)
time([[Conditional loading of cmp-buffer]], true)
  require("packer.load")({"cmp-buffer"}, {}, _G.packer_plugins)
time([[Conditional loading of cmp-buffer]], false)
time([[Conditional loading of cmp-cmdline]], true)
  require("packer.load")({"cmp-cmdline"}, {}, _G.packer_plugins)
time([[Conditional loading of cmp-cmdline]], false)
time([[Conditional loading of popup.nvim]], true)
  require("packer.load")({"popup.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of popup.nvim]], false)
time([[Conditional loading of nvim-lspconfig]], true)
  require("packer.load")({"nvim-lspconfig"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-lspconfig]], false)
time([[Conditional loading of cmp-nvim-lsp]], true)
  require("packer.load")({"cmp-nvim-lsp"}, {}, _G.packer_plugins)
time([[Conditional loading of cmp-nvim-lsp]], false)
time([[Conditional loading of cmp-calc]], true)
  require("packer.load")({"cmp-calc"}, {}, _G.packer_plugins)
time([[Conditional loading of cmp-calc]], false)
time([[Conditional loading of night-owl.vim]], true)
  require("packer.load")({"night-owl.vim"}, {}, _G.packer_plugins)
time([[Conditional loading of night-owl.vim]], false)
time([[Conditional loading of cmp-path]], true)
  require("packer.load")({"cmp-path"}, {}, _G.packer_plugins)
time([[Conditional loading of cmp-path]], false)
time([[Conditional loading of firenvim]], true)
  require("packer.load")({"firenvim"}, {}, _G.packer_plugins)
time([[Conditional loading of firenvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
