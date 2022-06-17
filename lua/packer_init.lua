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
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost packer_init.lua source <afile> | PackerSync
--   augroup end
-- ]])

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
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  })
  use("romgrk/fzy-lua-native")

  -- Telescope extensions
  use("nvim-telescope/telescope-frecency.nvim")
  use("ahmedkhalf/project.nvim")
  use("nvim-telescope/telescope-file-browser.nvim") -- required by project.nvim
  use("tami5/sqlite.lua") -- required by telescope-frecency
  -- use("nvim-telescope/telescope-project.nvim") #using ahmedkhalf/project.nvim

  -- Treesitter
  -- Additional textobjects for treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("nvim-treesitter/nvim-treesitter-context")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("windwp/nvim-ts-autotag")
  use("windwp/nvim-autopairs") -- integrated with both cmp and treesitter

  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json
  use("jose-elias-alvarez/null-ls.nvim") -- formatters and linters
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
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
  use("saadparwaiz1/cmp_luasnip")

  -- General
  use("numToStr/Comment.nvim")
  use("ryanoasis/vim-devicons")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  -- use({ "akinsho/bufferline.nvim", tag = "v2.*" })
  use("romgrk/barbar.nvim")
  use("nvim-lualine/lualine.nvim")
  use("voldikss/vim-floaterm")
  use("akinsho/toggleterm.nvim") -- needed for lazygit can migrate to floaterm but oh well
  use("tpope/vim-unimpaired")
  -- use("tpope/vim-fugitive")
  use("machakann/vim-sandwich")
  use("tpope/vim-repeat")
  -- use("tpope/vim-obsession")
  use("preservim/vim-markdown")
  use("godlygeek/tabular") -- format tables

  use("sindrets/diffview.nvim") -- tabpage interface for diffs
  -- use("anuvyklack/pretty-fold.nvim")
  use("akinsho/git-conflict.nvim")
  -- use("rhysd/conflict-marker.vim") -- git-conflict.nvim better
  -- use("christoomey/vim-conflicted")
  -- use("whiteinge/diffconflicts")

  use("lewis6991/impatient.nvim")

  -- use("goolord/alpha-nvim")
  use("mhinz/vim-startify")

  use("antoinemadec/FixCursorHold.nvim") -- needed to fix LSP doc highlight
  use("folke/which-key.nvim")
  use("folke/lsp-colors.nvim")

  use("lewis6991/gitsigns.nvim")
  use("norcalli/nvim-colorizer.lua")
  -- use("ggandor/leap.nvim")
  use("ggandor/lightspeed.nvim")
  use("rhysd/clever-f.vim")
  -- use "rmagatti/auto-session"
  -- use("Pocco81/AutoSave.nvim")
  use("907th/vim-auto-save")

  use("jremmen/vim-ripgrep")
  use("mbbill/undotree")

  -- run code within nvim
  use("erietz/vim-terminator")
  -- use("EvanQuan/vim-executioner")
  -- use("pianocomposer321/yabs.nvim")
  -- use("CRAG666/code_runner.nvim")

  -- use("kwkarlwang/bufjump.nvim") -- interesting
  use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines

  -- use("takac/vim-hardtime")
  use("jose-elias-alvarez/typescript.nvim")
  use("gbprod/substitute.nvim")
  use("gbprod/cutlass.nvim")

  -- use({ "gbprod/yanky.nvim", branch = "main" })
  use("gbprod/yanky.nvim") -- BUG THIS DEFINITELY FREEZES nvim
  -- use("svermeulen/vim-yoink") -- BUG FREEZES nvim?
  use("gelguy/wilder.nvim")
  use("simrat39/symbols-outline.nvim")
  use("mtdl9/vim-log-highlighting")
  use("dstein64/nvim-scrollview")
  -- use("rcarriga/nvim-notify")
  use("ledger/vim-ledger")
  use("chrisbra/csv.vim")
  use("ldelossa/litee.nvim") -- required by gh.nvim
  use("ldelossa/gh.nvim")
  use({ "michaelb/sniprun", run = "bash ./install.sh" })
  use("ekickx/clipboard-image.nvim")

  use("ray-x/lsp_signature.nvim")
  -- use { 'ray-x/navigator.lua',
  --     requires = { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' }
  -- }
  use("windwp/nvim-spectre")
  use("brooth/far.vim")
  -- use("nyngwang/NeoZoom.lua") -- doesn't work on Spectre
  use("dhruvasagar/vim-zoom") -- works on Spectre

  use({ "mg979/vim-visual-multi", branch = "master" })
  use("karb94/neoscroll.nvim")
  -- use("max397574/better-escape.nvim")
  use("wellle/targets.vim")
  use("kevinhwang91/nvim-bqf")
  use("mhinz/vim-grepper")
  use("danilamihailov/beacon.nvim")
  use("folke/trouble.nvim")
  use("nathom/filetype.nvim") -- speed up startup time
  use("vim-scripts/LargeFile")
  use("luukvbaal/stabilize.nvim")
  use({
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
  })

  -- Colorschemes/theme
  use("lunarvim/colorschemes")
  use("NTBBloodbath/doom-one.nvim")
  use("marko-cerovac/material.nvim")
  use("EdenEast/nightfox.nvim")
  use("navarasu/onedark.nvim")
  use("bluz71/vim-moonfly-colors")
  use("bluz71/vim-nightfly-guicolors")
  use("projekt0n/github-nvim-theme")

  -- without its own file
  use("p00f/nvim-ts-rainbow")
  use("ThePrimeagen/harpoon")
  use("junegunn/vim-emoji")
  use("sheerun/vim-polyglot")
  use("kovetskiy/sxhkd-vim")
  use("tversteeg/registers.nvim") -- see register contents
  use("romainl/vim-cool") -- remove search result highlight
  use("junegunn/fzf.vim") -- for nvim-bqf
  use("ibhagwan/fzf-lua")
  use("junegunn/vim-easy-align")
  use("andymass/vim-matchup")
  -- use("chaoren/vim-wordmotion")
  use("mfussenegger/nvim-jdtls")
  use("sunaku/tmux-navigate")
  use("famiu/bufdelete.nvim")
  use("moll/vim-bbye")
  use("farmergreg/vim-lastplace")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
