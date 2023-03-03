local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  "nvim-lua/popup.nvim", -- implementation of Popup API to Neovim
  "nvim-lua/plenary.nvim", -- useful lua functions used by lots of plugins

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "romgrk/fzy-lua-native",
    },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  -- Telescope extensions
  "ahmedkhalf/project.nvim",
  "AckslD/nvim-neoclip.lua", -- clipboard manager
  "marcuscaisey/olddirs.nvim", -- `:oldfiles` but for directories
  "nvim-telescope/telescope-frecency.nvim",
  "kkharji/sqlite.lua", -- required by `telescope-frecency` and `neoclip`
  -- "nvim-telescope/telescope-project.nvim", -- using project.nvim
  -- "nvim-telescope/telescope-file-browser.nvim", -- required by telescope-project.nvim

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  -- { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },
  "windwp/nvim-ts-autotag",
  "windwp/nvim-autopairs", -- integrated with cmp and treesitter
  -- "mrjones2014/nvim-ts-rainbow", -- rainbow parentheses
  "https://gitlab.com/HiPhish/nvim-ts-rainbow2",
  "lukas-reineke/indent-blankline.nvim", -- indentation guides
  "mizlan/iswap.nvim",
  "monaqa/dial.nvim",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "tamago324/nlsp-settings.nvim", -- language server settings defined in json
  "jose-elias-alvarez/null-ls.nvim", -- formatters and linters when LSP is not present
  -- "rmagatti/goto-preview",
  "glepnir/lspsaga.nvim",
  "folke/trouble.nvim",
  "onsails/lspkind.nvim", -- pictograms
  "folke/lsp-colors.nvim", -- LSP diagnostics highlight groups
  -- "simrat39/symbols-outline.nvim", -- using `lspsaga`
  -- "ray-x/lsp_signature.nvim", -- usine `lspsaga`
  "b0o/schemastore.nvim",
  "jose-elias-alvarez/typescript.nvim",
  "mfussenegger/nvim-jdtls",

  -- Autocomplete engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
    },
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip", -- snippet engine
    dependencies = {
      "rafamadriz/friendly-snippets", -- provided snippets
      "saadparwaiz1/cmp_luasnip", -- completion engine
    },
  },

  -- General
  -- "ibhagwan/fzf-lua", -- for `:changes`
  "tpope/vim-repeat",
  "numToStr/Comment.nvim",
  "kyazdani42/nvim-web-devicons", -- lua fork of vim-devicons
  "kyazdani42/nvim-tree.lua",
  "akinsho/bufferline.nvim",
  -- "tiagovla/scope.nvim", -- scoped tabline
  "famiu/bufdelete.nvim", -- preserve layout when deleting buffers
  -- "nvim-lualine/lualine.nvim", -- statusline
  "feline-nvim/feline.nvim",

  "akinsho/toggleterm.nvim", -- general terminal
  "is0n/fm-nvim", -- `ranger`
  "kdheepak/lazygit.nvim",

  "kylechui/nvim-surround",
  -- "machakann/vim-sandwich",

  "andymass/vim-matchup", -- enhanced with `nvim-treesitter-textobjects`
  -- "abecodes/tabout.nvim", -- tabbing out from parentheses, quotes
  -- "wellle/targets.vim", -- superseded by `nvim-treesitter-textobjects`
  "mbbill/undotree",

  "Pocco81/auto-save.nvim", -- auto-format when saving
  -- TODO: check if https://github.com/Pocco81/auto-save.nvim/pull/67 merged to disable message to cmd

  -- "anuvyklack/pretty-fold.nvim",
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = {
  --     "kevinhwang91/promise-async",
  --   },
  -- },

  -- "sindrets/diffview.nvim", -- tabpage interface for diffs
  -- "akinsho/git-conflict.nvim",

  "lewis6991/impatient.nvim",
  -- {
  --   "dstein64/vim-startuptime",
  --   cmd = "StartupTime",
  -- },
  -- "goolord/alpha-nvim",
  -- "mhinz/vim-startify",

  -- session management
  "rmagatti/auto-session",
  "rmagatti/session-lens", -- telescope integration

  {
    "mrjones2014/legendary.nvim",
    dependencies = {
      { "stevearc/dressing.nvim", event = "VeryLazy" },
    },
  },
  "lewis6991/gitsigns.nvim",

  -- navigation
  "ggandor/leap.nvim",
  -- "ggandor/flit.nvim",
  "rhysd/clever-f.vim",
  -- "ggandor/leap-spooky.nvim",
  "cbochs/grapple.nvim",
  "cbochs/portal.nvim",
  -- "LeonHeidelbach/trailblazer.nvim",
  "chentoast/marks.nvim",
  "aserowy/tmux.nvim",

  "kevinhwang91/nvim-bqf",
  "https://gitlab.com/yorickpeterse/nvim-pqf", -- pretty list

  -- filetypes
  "nathom/filetype.nvim", -- speed up startup time
  {
    "preservim/vim-markdown",
    ft = "markdown",
    dependencies = {
      "godlygeek/tabular",
    },
  },
  { "mtdl9/vim-log-highlighting", ft = "log" },
  { "ledger/vim-ledger", ft = "ledger" },
  { "chrisbra/csv.vim", ft = { "csv", "dat" } },

  -- task runners
  { "michaelb/sniprun", build = "bash ./install.sh" },
  "CRAG666/code_runner.nvim",
  -- "stevearc/overseer.nvim", -- TODO: configure

  -- "Exafunction/codeium.vim",

  "gbprod/substitute.nvim",
  "gbprod/cutlass.nvim",
  "gbprod/stay-in-place.nvim",
  "booperlv/nvim-gomove",
  -- "gbprod/yanky.nvim",

  "gelguy/wilder.nvim",

  "ja-ford/delaytrain.nvim",
  "gpanders/editorconfig.nvim",
  -- "ekickx/clipboard-image.nvim", -- copy clipboard image to nvim

  -- find and replace
  "nvim-pack/nvim-spectre",
  "mg979/vim-visual-multi",

  "chrisgrieser/nvim-recorder",
  -- "smjonas/live-command.nvim",

  -- note-taking
  -- "renerocksai/telekasten.nvim",
  -- "epwalsh/obsidian.nvim", -- bug with `undotree`

  -- aesthetics
  "rcarriga/nvim-notify",
  "declancm/cinnamon.nvim", -- smooth scrolling
  "danilamihailov/beacon.nvim", -- flash cursor when jumping

  "petertriho/nvim-scrollbar", -- scrollbar
  {
    "dstein64/nvim-scrollview", -- scrollable bar
    cmd = "ScrollViewEnable",
    config = function()
      require("plugins.scrollview") -- lazyloading
    end,
  },

  {
    "tummetott/reticle.nvim",
    config = function()
      require("reticle").setup({})
    end,
  },

  "RRethy/vim-illuminate", -- highlighting other uses of the word under cursor
  "b0o/incline.nvim", -- floating statuslines
  -- "LudoPinelli/comment-box.nvim", TODO: wait till it's fixed -- create comment boxes
  "folke/todo-comments.nvim",
  -- "folke/noice.nvim", -- NOTE: use later because it requires nightly

  {
    "princejoogie/chafa.nvim",
    dependencies = {
      "m00qek/baleia.nvim",
    },
  },

  "kevinhwang91/nvim-hlslens", -- better search results
  -- "romainl/vim-cool", -- using `nvim-hlslens`

  -- TODO: check is merged to core in stable 0.9
  "luukvbaal/stabilize.nvim", -- stabilize buffer content on window open/close events

  "tversteeg/registers.nvim", -- see register contents
  "nyngwang/NeoZoom.lua", -- `<C-w>o` maximizes window without closing other buffers
  "ethanholz/nvim-lastplace", -- open files at last edit position
  "max397574/colortils.nvim",
  "norcalli/nvim-colorizer.lua",

  -- {
  --   "glacambre/firenvim",
  --   build = function()
  --     vim.fn["firenvim#install"](0)
  --   end,
  --   -- Lazy load
  --   -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
  --   cond = not not vim.g.started_by_firenvim,
  -- },

  -- debuggers
  -- "mfussenegger/nvim-dap",
  -- "rcarriga/nvim-dap-ui",
  -- "puremourning/vimspector",
  -- test
  -- "vim-test/vim-test",

  -- Colorschemes/themes
  -- "NTBBloodbath/doom-one.nvim",
  "rmehri01/onenord.nvim",
  "rebelot/kanagawa.nvim",
  "EdenEast/nightfox.nvim", -- used by firenvim
  "folke/tokyonight.nvim",
  "catppuccin/nvim",
})
