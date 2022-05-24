-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save this packer_init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("romgrk/fzy-lua-native")
  use("nvim-telescope/telescope-frecency.nvim")

  -- Treesitter
  -- Additional textobjects for treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("windwp/nvim-ts-autotag")
  use("windwp/nvim-autopairs") -- integrated with both cmp and treesitter

  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  -- use("lukas-reineke/lsp-format.nvim") -- formatting management
  use("b0o/schemastore.nvim")

  -- Autocomplete engine
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
    },
  })

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
  use("saadparwaiz1/cmp_luasnip")
  -- For vsnip users
  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'
  -- For luasnip users
  -- For ultisnips users
  -- use 'SirVer/ultisnips'
  -- use 'quangnguyen30192/cmp-nvim-ultisnips'
  -- For snippy users
  -- use 'dcampos/nvim-snippy'
  -- use 'dcampos/cmp-snippy'

  -- General
  use("numToStr/Comment.nvim")
  use("ryanoasis/vim-devicons")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use({ "akinsho/bufferline.nvim", tag = "*" })
  use("nvim-lualine/lualine.nvim")
  use("akinsho/toggleterm.nvim") -- needed for lazygit
  -- use("tpope/vim-unimpaired")
  -- use("tpope/vim-fugitive")
  use("machakann/vim-sandwich")
  use("tpope/vim-repeat")
  use("tpope/vim-obsession")
  -- use("tpope/vim-markdown")
  -- use("anuvyklack/pretty-fold.nvim")
  use("sindrets/diffview.nvim")
  -- use("whiteinge/diffconflicts")
  use("ahmedkhalf/project.nvim")
  use("lewis6991/impatient.nvim")
  -- use("goolord/alpha-nvim")
  use("mhinz/vim-startify")
  use("antoinemadec/FixCursorHold.nvim") -- needed to fix lsp doc highlight
  use("folke/which-key.nvim")
  use("folke/lsp-colors.nvim")

  use("lewis6991/gitsigns.nvim")
  use("norcalli/nvim-colorizer.lua")
  use("ggandor/lightspeed.nvim")
  -- use("ggandor/leap.nvim")
  -- use "rmagatti/auto-session"
  -- use "Pocco81/AutoSave.nvim"
  use("jremmen/vim-ripgrep")
  use("mbbill/undotree")
  use("EvanQuan/vim-executioner")
  use("voldikss/vim-floaterm")

  use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines

  use("takac/vim-hardtime")
  use("jose-elias-alvarez/typescript.nvim")
  use("gbprod/substitute.nvim")
  use("gbprod/cutlass.nvim")
  -- use("gbprod/yanky.nvim") -- BUG THIS FREEZES nvim
  use("svermeulen/vim-yoink") -- BUG FREEZES nvim?
  use("gelguy/wilder.nvim")
  use("tami5/sqlite.lua") -- required by telescope-frecency
  use("simrat39/symbols-outline.nvim")
  use("mtdl9/vim-log-highlighting")
  use("dstein64/nvim-scrollview")
  use("rcarriga/nvim-notify")
  use("ledger/vim-ledger")

  -- use { 'ray-x/navigator.lua',
  --     requires = { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' }
  -- }
  -- use("ray-x/sad.nvim")
  use("ray-x/lsp_signature.nvim")

  use({ "mg979/vim-visual-multi", branch = "master" })
  -- use("ethanholz/nvim-lastplace")
  use("karb94/neoscroll.nvim")
  -- use("max397574/better-escape.nvim")
  use("wellle/targets.vim")
  use("kevinhwang91/nvim-bqf")
  use("mhinz/vim-grepper")
  use("danilamihailov/beacon.nvim")
  use("folke/trouble.nvim")
  use("nathom/filetype.nvim") -- speed up startup time
  use("vim-scripts/LargeFile")
  use({
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
  })
  use({
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
  })

  -- Colorschemes/theme
  use("lunarvim/colorschemes") -- a bunch of colorschemes
  use("NTBBloodbath/doom-one.nvim")
  use("marko-cerovac/material.nvim")
  use("EdenEast/nightfox.nvim")
  use("navarasu/onedark.nvim")
  use("LunarVim/onedarker.nvim")
  use("bluz71/vim-moonfly-colors")
  use("bluz71/vim-nightfly-guicolors")
  use("sainnhe/sonokai")
  use("Shatur/neovim-ayu")
  use("sainnhe/edge")
  use("projekt0n/github-nvim-theme")

  -- without its own file
  use("p00f/nvim-ts-rainbow")
  use("ThePrimeagen/harpoon")
  use("junegunn/vim-emoji")
  use("sheerun/vim-polyglot")
  use("kovetskiy/sxhkd-vim")
  -- use("junegunn/vim-peekaboo") -- see register contents
  use("tversteeg/registers.nvim") -- better than peekaboo
  use("romainl/vim-cool") -- remove search result highlight
  use("junegunn/fzf.vim") -- for nvim-bqf
  use("junegunn/vim-easy-align")
  use("andymass/vim-matchup")
  -- use("mhinz/vim-sayonara")
  -- use("chaoren/vim-wordmotion")
  use("mfussenegger/nvim-jdtls")
  use("sunaku/tmux-navigate")
  use("famiu/bufdelete.nvim")
  use("moll/vim-bbye")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
