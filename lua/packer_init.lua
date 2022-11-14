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
  use("nvim-lua/popup.nvim") -- implementation of Popup API to Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins

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
  use("kkharji/sqlite.lua") -- required by telescope-frecency
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
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json
  use("jose-elias-alvarez/null-ls.nvim") -- formatters and linters when LSP is not present
  use("rmagatti/goto-preview")
  use("glepnir/lspsaga.nvim")
  use("b0o/schemastore.nvim")
  use("jose-elias-alvarez/typescript.nvim")
  use("mfussenegger/nvim-jdtls")
  use("antoinemadec/FixCursorHold.nvim") -- fix LSP doc highlight
  use("ray-x/lsp_signature.nvim")
  use("onsails/lspkind.nvim") -- pictograms to LSP

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
  -- use("ibhagwan/fzf-lua")
  use("tpope/vim-repeat")
  use("numToStr/Comment.nvim")
  use("kyazdani42/nvim-web-devicons") -- lua fork of vim-devicons
  use("kyazdani42/nvim-tree.lua")
  -- use("akinsho/bufferline.nvim")
  use("romgrk/barbar.nvim") -- tabline
  use("nvim-lualine/lualine.nvim") -- statusline
  use("voldikss/vim-floaterm") -- need for `lazygit` and `ranger`
  use("akinsho/toggleterm.nvim") -- general terminal
  -- use("tpope/vim-fugitive") -- use lazygit
  use("machakann/vim-sandwich") -- better than surround
  use("wellle/targets.vim") -- more text objects
  use("andymass/vim-matchup") -- navigate matching text
  -- use("chaoren/vim-wordmotion")

  -- use("anuvyklack/pretty-fold.nvim")
  -- use("kevinhwang91/nvim-ufo")
  -- use("kevinhwang91/promise-async") -- required by nvim-ufo

  use("sindrets/diffview.nvim") -- tabpage interface for diffs
  use("akinsho/git-conflict.nvim")
  -- use("rhysd/conflict-marker.vim") -- git-conflict.nvim better
  -- use("christoomey/vim-conflicted")
  -- use("whiteinge/diffconflicts")

  use("lewis6991/impatient.nvim")
  -- use("dstein64/vim-startuptime") -- test impatient
  -- use("goolord/alpha-nvim")
  -- use("mhinz/vim-startify")

  -- session management
  -- use("rmagatti/auto-session")
  -- use("rmagatti/session-lens") -- telescope integration

  use("folke/which-key.nvim")
  use("folke/lsp-colors.nvim") -- creates missing LSP diagnostics highlight groups for colorschemes that don't yet support LSP

  use("lewis6991/gitsigns.nvim")
  use("norcalli/nvim-colorizer.lua")

  -- navigation
  use("ggandor/leap.nvim")
  -- use("ggandor/lightspeed.nvim")
  use("rhysd/clever-f.vim")

  use("inkarkat/vim-EnhancedJumps")
  use("inkarkat/vim-ingo-library") -- required by vim-EnhancedJumps

  -- auto-format when saving
  use("Pocco81/auto-save.nvim")
  -- use("907th/vim-auto-save")

  use("kevinhwang91/nvim-bqf")
  use("https://gitlab.com/yorickpeterse/nvim-pqf") -- pretty list

  use("jremmen/vim-ripgrep")
  use("mbbill/undotree")
  -- use("beauwilliams/focus.nvim")

  -- filetypes
  use("nathom/filetype.nvim") -- speed up startup time
  use("preservim/vim-markdown")
  use("godlygeek/tabular") -- format tables
  use("mtdl9/vim-log-highlighting")
  use("ledger/vim-ledger")
  use("chrisbra/csv.vim")

  -- Code runners
  --use("erietz/vim-terminator")
  use({ "michaelb/sniprun", run = "bash ./install.sh" })
  -- use("EvanQuan/vim-executioner")
  use("CRAG666/code_runner.nvim")

  use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines

  -- use("takac/vim-hardtime")
  use("gbprod/substitute.nvim")
  use("gbprod/cutlass.nvim")

  use("gelguy/wilder.nvim")
  use("simrat39/symbols-outline.nvim")
  -- use("ekickx/clipboard-image.nvim") -- copy clipboard image to nvim

  -- use("gbprod/yanky.nvim")
  -- use("svermeulen/vim-yoink")

  -- find and replace
  use("windwp/nvim-spectre")
  -- use("brooth/far.vim")

  -- note-taking
  -- use("vimwiki/vimwiki")
  -- use("renerocksai/telekasten.nvim")
  -- use("renerocksai/calendar-vim")

  -- aesthetics
  use("dstein64/nvim-scrollview") -- scrollbars
  use("karb94/neoscroll.nvim") -- smooth scrolling
  -- use("lukas-reineke/headlines.nvim") -- prettier markdown
  use("danilamihailov/beacon.nvim") -- flash cursor when jumping
  use("luukvbaal/stabilize.nvim") -- stabilize buffer content on window open/close events
  use("romainl/vim-cool") -- search highlighting when done
  use("LudoPinelli/comment-box.nvim") -- create comment box

  use("nyngwang/NeoZoom.lua") -- `<C-w>m` to maximize window without closing other buffers
  use("farmergreg/vim-lastplace") -- reopen files at last edit position
  use("KabbAmine/vCoolor.vim") -- color picker
  use({ "mg979/vim-visual-multi", branch = "master" })
  -- use("max397574/better-escape.nvim")
  use("mhinz/vim-grepper")
  use("folke/trouble.nvim")
  use("vim-scripts/LargeFile")
  use({
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
  })

  -- debugger
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  -- use("puremourning/vimspector")

  -- test
  use("vim-test/vim-test")

  use("aserowy/tmux.nvim")
  -- use("sunaku/tmux-navigate")
  -- use("numToStr/Navigator.nvim")

  use("p00f/nvim-ts-rainbow")
  use("ThePrimeagen/harpoon")
  use("junegunn/vim-emoji")
  --use("sheerun/vim-polyglot")
  -- use("kovetskiy/sxhkd-vim")
  use("tversteeg/registers.nvim") -- see register contents
  use("junegunn/vim-easy-align")
  use("moll/vim-bbye") -- delete buffers without closing windows

  -- Colorschemes/theme
  use("NTBBloodbath/doom-one.nvim")
  use("EdenEast/nightfox.nvim") -- used by firenvim
  use("navarasu/onedark.nvim")
  -- use("bluz71/vim-moonfly-colors")
  -- use("bluz71/vim-nightfly-guicolors")
  -- use("projekt0n/github-nvim-theme")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
