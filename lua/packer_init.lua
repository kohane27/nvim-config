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
  use("AckslD/nvim-neoclip.lua") -- clipboard manager
  use("kkharji/sqlite.lua") -- required by telescope-frecency
  -- use("nvim-telescope/telescope-project.nvim") #using ahmedkhalf/project.nvim

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("nvim-treesitter/nvim-treesitter-context")
  use({ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" })
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("windwp/nvim-ts-autotag")
  use("windwp/nvim-autopairs") -- integrated with cmp and treesitter
  use("p00f/nvim-ts-rainbow") -- rainbow parentheses
  use("lukas-reineke/indent-blankline.nvim") -- indentation guides

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
  -- use("mfussenegger/nvim-jdtls")
  use("folke/trouble.nvim")
  use("ray-x/lsp_signature.nvim")
  use("onsails/lspkind.nvim") -- pictograms to LSP
  use("folke/lsp-colors.nvim") -- add LSP diagnostics highlight groups

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
  use("ibhagwan/fzf-lua") -- for :changes
  use("tpope/vim-repeat")
  use("numToStr/Comment.nvim")
  use("kyazdani42/nvim-web-devicons") -- lua fork of vim-devicons
  use("kyazdani42/nvim-tree.lua")
  -- use("akinsho/bufferline.nvim")
  use("romgrk/barbar.nvim") -- tabline
  -- use("famiu/bufdelete.nvim") -- preserve layout when deleting buffer(s)
  use("nvim-lualine/lualine.nvim") -- statusline
  use("voldikss/vim-floaterm") -- need for `lazygit` and `ranger`
  use("akinsho/toggleterm.nvim") -- general terminal
  use("kylechui/nvim-surround")
  use("andymass/vim-matchup") -- navigate matching text enhanced with `nvim-treesitter-textobjects`
  -- use("wellle/targets.vim") -- superseded by `nvim-treesitter-textobjects`
  use("mbbill/undotree")
  use("Pocco81/auto-save.nvim") -- auto-format when saving
  use("gpanders/editorconfig.nvim")

  -- use("anuvyklack/pretty-fold.nvim")
  -- use("kevinhwang91/nvim-ufo")
  -- use("kevinhwang91/promise-async") -- required by nvim-ufo

  use("sindrets/diffview.nvim") -- tabpage interface for diffs
  use("akinsho/git-conflict.nvim")

  use("lewis6991/impatient.nvim")
  -- use("dstein64/vim-startuptime") -- test impatient
  -- use("goolord/alpha-nvim")
  -- use("mhinz/vim-startify")

  -- session management
  -- use("rmagatti/auto-session")
  -- use("rmagatti/session-lens") -- telescope integration

  use("mrjones2014/legendary.nvim")
  use("stevearc/dressing.nvim") -- required by legendary.nvim
  use("lewis6991/gitsigns.nvim")
  use("norcalli/nvim-colorizer.lua")

  -- navigation
  use("ggandor/leap.nvim")
  use("ggandor/flit.nvim")
  -- use("ggandor/leap-spooky.nvim")

  use("aserowy/tmux.nvim")
  use("cbochs/grapple.nvim")
  use("cbochs/portal.nvim")

  use("kevinhwang91/nvim-bqf")
  use("https://gitlab.com/yorickpeterse/nvim-pqf") -- pretty list

  -- filetypes
  use("nathom/filetype.nvim") -- speed up startup time
  use("preservim/vim-markdown")
  use("godlygeek/tabular") -- format tables
  use("mtdl9/vim-log-highlighting")
  use("ledger/vim-ledger")
  use("chrisbra/csv.vim")

  -- task runners
  -- use("stevearc/overseer.nvim") -- TODO learn
  use({ "michaelb/sniprun", run = "bash ./install.sh" })
  use("CRAG666/code_runner.nvim")

  use("ja-ford/delaytrain.nvim")

  use("gbprod/substitute.nvim")
  use("gbprod/cutlass.nvim")
  use("gbprod/stay-in-place.nvim")
  -- use("gbprod/yanky.nvim")

  use("gelguy/wilder.nvim")
  -- use("simrat39/symbols-outline.nvim") -- using lspsaga
  -- use("ekickx/clipboard-image.nvim") -- copy clipboard image to nvim

  -- find and replace
  use("windwp/nvim-spectre")
  use({ "mg979/vim-visual-multi", branch = "master" })
  -- use("smjonas/live-command.nvim") -- TODO learn
  -- use("brooth/far.vim")

  -- note-taking
  -- use("vimwiki/vimwiki")
  -- use("renerocksai/telekasten.nvim")

  -- aesthetics
  use("karb94/neoscroll.nvim") -- smooth scrolling
  use("dstein64/nvim-scrollview") -- scrollable bar
  use("petertriho/nvim-scrollbar") -- scrollbar

  use("RRethy/vim-illuminate") -- highlighting other uses of the word under cursor
  use("danilamihailov/beacon.nvim") -- flash cursor when jumping
  use("b0o/incline.nvim") -- floating statuslines
  use("LudoPinelli/comment-box.nvim") -- create comment boxes
  use("Djancyp/better-comments.nvim") -- highlight comments
  -- use("folke/noice.nvim") -- use later because it requires nightly

  use("kevinhwang91/nvim-hlslens") -- better search results
  -- use("romainl/vim-cool") -- using `nvim-hlslens`

  -- TODO check is merged to core in stable 0.9
  use("luukvbaal/stabilize.nvim") -- stabilize buffer content on window open/close events

  use("tversteeg/registers.nvim") -- see register contents
  use("nyngwang/NeoZoom.lua") -- `<C-w>m` to maximize window without closing other buffers
  use("ethanholz/nvim-lastplace") -- reopen files at last edit position
  use("max397574/colortils.nvim") -- color utils -- TODO learn how to use
  -- use({
  --   "glacambre/firenvim",
  --   run = function()
  --     vim.fn["firenvim#install"](0)
  --   end,
  -- })

  -- debuggers
  -- use("mfussenegger/nvim-dap")
  -- use("rcarriga/nvim-dap-ui")
  -- use("puremourning/vimspector")
  -- test
  use("vim-test/vim-test")

  -- Colorschemes/themes
  use("NTBBloodbath/doom-one.nvim")
  use("EdenEast/nightfox.nvim") -- used by firenvim
  use("navarasu/onedark.nvim")
  use("folke/tokyonight.nvim") -- scrollbar theme
  -- use("bluz71/vim-moonfly-colors")
  -- use("bluz71/vim-nightfly-guicolors")
  -- use("projekt0n/github-nvim-theme")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
