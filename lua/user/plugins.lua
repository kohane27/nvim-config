local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  --use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- needed to fix lsp doc highlight
  use "folke/which-key.nvim"

  -- Colorschemes
   use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- TODO For vsnip users
  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'

  -- For luasnip users
  -- use 'L3MON4D3/LuaSnip'
  -- use 'saadparwaiz1/cmp_luasnip'

  -- For ultisnips users
  -- use 'SirVer/ultisnips'
  -- use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- For snippy users
  -- use 'dcampos/nvim-snippy'
  -- use 'dcampos/cmp-snippy'

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- with its own file
  use "norcalli/nvim-colorizer.lua"
  use "ggandor/lightspeed.nvim"
  use "rmagatti/auto-session"
  use "jremmen/vim-ripgrep"
  use "farmergreg/vim-lastplace"
  use "Pocco81/AutoSave.nvim"
  use "Shougo/echodoc.vim"
  use "mbbill/undotree"
  use "vimwiki/vimwiki"
  use "EvanQuan/vim-executioner"
  use "voldikss/vim-floaterm"
  use "preservim/nerdcommenter"
  use "glepnir/dashboard-nvim"

  -- without its own file
  use "p00f/nvim-ts-rainbow"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "ThePrimeagen/harpoon"
  use "junegunn/vim-emoji"
  use "sheerun/vim-polyglot"
  use "kovetskiy/sxhkd-vim"
  use "junegunn/vim-easy-align"
  use {'mg979/vim-visual-multi', branch = 'master' }
  use "junegunn/vim-peekaboo"
  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "psliwka/vim-smoothie"
  use "wellle/targets.vim"
  use "kevinhwang91/nvim-bqf"
  use "andymass/vim-matchup"
  use "mhinz/vim-sayonara"
  --use 'mhartington/formatter.nvim'
  --use "tpope/vim-obsession"
  --use "tpope/vim-fugitive"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
