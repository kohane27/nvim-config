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
  { "nvim-telescope/telescope.nvim", dependencies = { "romgrk/fzy-lua-native" } },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  -- Telescope extensions
  "ahmedkhalf/project.nvim",
  -- "nvim-telescope/telescope-project.nvim", -- using project.nvim
  "AckslD/nvim-neoclip.lua", -- clipboard manager
  "marcuscaisey/olddirs.nvim", -- `:oldfiles` but for directories
  "nvim-telescope/telescope-frecency.nvim",
  "kkharji/sqlite.lua", -- required by `telescope-frecency` and `neoclip`

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
  "hiphish/rainbow-delimiters.nvim", -- rainbow parentheses
  "lukas-reineke/indent-blankline.nvim", -- indentation guides
  "mizlan/iswap.nvim",
  "monaqa/dial.nvim",

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
      },
    },
  },

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "tamago324/nlsp-settings.nvim", -- language server settings defined in json
  "jose-elias-alvarez/null-ls.nvim", -- formatters and linters when LSP is not present
  -- "rmagatti/goto-preview",
  "nvimdev/lspsaga.nvim",
  "folke/trouble.nvim",
  "onsails/lspkind.nvim", -- pictograms
  "folke/lsp-colors.nvim", -- LSP diagnostics highlight groups
  -- "simrat39/symbols-outline.nvim", -- using `lspsaga`
  -- "ray-x/lsp_signature.nvim", -- usine `lspsaga`
  "b0o/schemastore.nvim",
  "mfussenegger/nvim-jdtls",
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },

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
    build = "make install_jsregexp",
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

  "akinsho/toggleterm.nvim", -- terminal
  "is0n/fm-nvim", -- `ranger`
  -- "is0n/tui-nvim", -- `ranger`

  "kdheepak/lazygit.nvim",

  "kylechui/nvim-surround",
  -- "machakann/vim-sandwich",

  "andymass/vim-matchup", -- enhanced with `nvim-treesitter-textobjects`
  -- "abecodes/tabout.nvim", -- tabbing out from parentheses and quotes
  -- "wellle/targets.vim", -- superseded by `nvim-treesitter-textobjects`
  "mbbill/undotree",

  "https://git.sr.ht/~nedia/auto-save.nvim",

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },

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

  {
    "rmagatti/auto-session",
    dependencies = {
      "rmagatti/session-lens", -- telescope integration
    },
  },

  "mrjones2014/legendary.nvim",
  "stevearc/dressing.nvim",

  "lewis6991/gitsigns.nvim",

  -- navigation
  "ggandor/leap.nvim",
  -- "ggandor/flit.nvim",
  -- "rhysd/clever-f.vim",
  { "TheSafdarAwan/find-extender.nvim", branch = "alpha" },

  -- "ggandor/leap-spooky.nvim",
  "cbochs/grapple.nvim",
  "cbochs/portal.nvim",
  -- "LeonHeidelbach/trailblazer.nvim",
  "chentoast/marks.nvim",
  "aserowy/tmux.nvim",

  "kevinhwang91/nvim-bqf",
  "https://gitlab.com/yorickpeterse/nvim-pqf", -- pretty list

  -- filetypes
  -- "ekickx/clipboard-image.nvim", -- copy clipboard image to nvim

  { "mtdl9/vim-log-highlighting", ft = "log" },
  { "chrisbra/csv.vim", ft = { "csv", "dat" } },
  "ledger/vim-ledger",
  -- "kmonad/kmonad-vim",

  -- preview markdown
  "ellisonleao/glow.nvim",

  -- task runners
  { "michaelb/sniprun", build = "bash ./install.sh" },
  "CRAG666/code_runner.nvim",
  -- "stevearc/overseer.nvim", -- TODO: configure

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  -- "Exafunction/codeium.vim",

  "gbprod/substitute.nvim",
  "gbprod/cutlass.nvim",
  "gbprod/stay-in-place.nvim",
  "booperlv/nvim-gomove",
  -- "gbprod/yanky.nvim",

  "gelguy/wilder.nvim",

  -- "ja-ford/delaytrain.nvim",

  -- find and replace
  "nvim-pack/nvim-spectre",
  "mg979/vim-visual-multi",

  "chrisgrieser/nvim-recorder",
  -- "smjonas/live-command.nvim",

  -- aesthetics
  "rcarriga/nvim-notify",
  "declancm/cinnamon.nvim", -- smooth scrolling
  "danilamihailov/beacon.nvim", -- flash cursor when jumping

  "petertriho/nvim-scrollbar", -- scrollbar
  "dstein64/nvim-scrollview", -- scrollable bar

  {
    "tummetott/reticle.nvim",
    config = function()
      require("reticle").setup({})
    end,
  },

  "RRethy/vim-illuminate", -- highlighting other uses of the word under cursor
  "b0o/incline.nvim", -- floating statuslines
  "LudoPinelli/comment-box.nvim", -- create comment boxes
  "folke/todo-comments.nvim",
  -- "folke/noice.nvim", -- NOTE: use later because it requires nightly

  -- note-taking/task management
  "jakewvincent/mkdnflow.nvim", -- markdown conflicting with vim-wiki
  -- "vimwiki/vimwiki",
  -- "tools-life/taskwiki",

  {
    "princejoogie/chafa.nvim",
    dependencies = {
      "m00qek/baleia.nvim",
    },
  },

  "kevinhwang91/nvim-hlslens", -- better search results
  -- "romainl/vim-cool", -- using `nvim-hlslens`

  "tversteeg/registers.nvim", -- see register contents
  "nyngwang/NeoZoom.lua", -- `<C-w>o` maximizes window without closing other buffers
  "ethanholz/nvim-lastplace", -- open files at last edit position
  "max397574/colortils.nvim",
  "norcalli/nvim-colorizer.lua",

  {
    "glacambre/firenvim",
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    cond = not not vim.g.started_by_firenvim,
    build = function()
      require("lazy").load({ plugins = "firenvim", wait = true })
      vim.fn["firenvim#install"](0)
    end,
  },

  -- debuggers
  -- "mfussenegger/nvim-dap",
  -- "rcarriga/nvim-dap-ui",
  -- "puremourning/vimspector",
  -- test
  -- "vim-test/vim-test",

  -- Colorschemes/themes
  -- "NTBBloodbath/doom-one.nvim",
  "rebelot/kanagawa.nvim",
  "rmehri01/onenord.nvim",
  "EdenEast/nightfox.nvim", -- used by firenvim
  "folke/tokyonight.nvim",
  "catppuccin/nvim",
})
