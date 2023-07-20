vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw at the very start of init.lua (nvim-tree recommends)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

require("lazy").setup({
  "nvim-lua/popup.nvim", -- implementation of Popup API to Neovim
  "nvim-lua/plenary.nvim", -- useful lua functions used by lots of plugins

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "romgrk/fzy-lua-native" }, event = "VeryLazy" },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    event = "VeryLazy",
  },

  -- Telescope extensions
  { "ahmedkhalf/project.nvim", event = "VeryLazy" },
  -- "nvim-telescope/telescope-project.nvim", -- using project.nvim
  -- clipboard manager
  { "AckslD/nvim-neoclip.lua", dependencies = { "kkharji/sqlite.lua" }, event = "VeryLazy" },
  -- `:oldfiles` but for directories
  { "marcuscaisey/olddirs.nvim", event = "VeryLazy" },
  { "nvim-telescope/telescope-frecency.nvim", dependencies = { "kkharji/sqlite.lua" }, event = "VeryLazy" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  -- enhanced with `nvim-treesitter-textobjects`
  { "andymass/vim-matchup", event = "VeryLazy" },
  -- { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },
  { "windwp/nvim-ts-autotag", event = "VeryLazy" },
  -- integrated with cmp and treesitter
  { "windwp/nvim-autopairs", event = "VeryLazy" },
  -- rainbow parentheses
  { "hiphish/rainbow-delimiters.nvim", event = "VeryLazy" },
  -- indentation guides
  { "lukas-reineke/indent-blankline.nvim", event = "VeryLazy" },
  { "mizlan/iswap.nvim", event = "VeryLazy" },
  { "monaqa/dial.nvim", event = "VeryLazy" },

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
    event = "VeryLazy",
  },

  { "williamboman/mason.nvim", event = "VeryLazy" },
  { "williamboman/mason-lspconfig.nvim", event = "VeryLazy" },
  -- language server settings defined in json
  { "tamago324/nlsp-settings.nvim", event = "VeryLazy" },

  -- formatters and linters when LSP is not present
  { "jose-elias-alvarez/null-ls.nvim", event = "VeryLazy" },

  -- "rmagatti/goto-preview",
  { "nvimdev/lspsaga.nvim", event = "VeryLazy" },

  { "folke/trouble.nvim", event = "VeryLazy" },

  -- pictograms
  { "onsails/lspkind.nvim", event = "VeryLazy" },

  -- LSP diagnostics highlight groups
  { "folke/lsp-colors.nvim", event = "VeryLazy" },

  -- "simrat39/symbols-outline.nvim", -- using `lspsaga`
  -- "ray-x/lsp_signature.nvim", -- usine `lspsaga`
  { "b0o/schemastore.nvim", event = "VeryLazy" },
  { "mfussenegger/nvim-jdtls", ft = "java", event = "VeryLazy" },
  {
    "pmizio/typescript-tools.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },

  -- Autocomplete engine
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
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
    event = "VeryLazy",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- provided snippets
      "saadparwaiz1/cmp_luasnip", -- completion engine
    },
  },

  -- General
  -- "ibhagwan/fzf-lua", -- for `:changes`
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "numToStr/Comment.nvim", event = "VeryLazy" },
  { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
  { "nvim-tree/nvim-tree.lua", event = "VeryLazy" },
  { "akinsho/bufferline.nvim", event = "VeryLazy" },
  -- "tiagovla/scope.nvim", -- scoped tabline
  -- preserve layout when deleting buffers
  { "famiu/bufdelete.nvim", event = "VeryLazy" },
  -- "nvim-lualine/lualine.nvim", -- statusline
  { "freddiehaddad/feline.nvim", event = "VeryLazy" },

  -- terminal
  { "akinsho/toggleterm.nvim", event = "VeryLazy" },

  -- `ranger`
  { "is0n/fm-nvim", event = "VeryLazy" },
  -- "is0n/tui-nvim", -- `ranger`

  { "kdheepak/lazygit.nvim", event = "VeryLazy" },

  { "kylechui/nvim-surround", event = "VeryLazy" },
  -- "machakann/vim-sandwich",

  -- "abecodes/tabout.nvim", -- tabbing out from parentheses and quotes
  -- "wellle/targets.vim", -- superseded by `nvim-treesitter-textobjects`
  { "mbbill/undotree", event = "VeryLazy" },

  { "https://git.sr.ht/~nedia/auto-save.nvim", event = "VeryLazy" },

  {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },

  -- "sindrets/diffview.nvim", -- tabpage interface for diffs
  -- "akinsho/git-conflict.nvim",

  -- {
  --   "dstein64/vim-startuptime",
  --   cmd = "StartupTime",
  -- },
  -- "goolord/alpha-nvim",
  -- "mhinz/vim-startify",

  -- session management

  {
    "rmagatti/auto-session",
    event = "VeryLazy",
    dependencies = {
      "rmagatti/session-lens", -- telescope integration
    },
  },

  { "mrjones2014/legendary.nvim", event = "VeryLazy" },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  { "lewis6991/gitsigns.nvim", event = "VeryLazy" },

  -- navigation
  { "ggandor/leap.nvim", event = "VeryLazy" },
  -- { "ggandor/leap-spooky.nvim", event = "VeryLazy" },
  -- { "ggandor/flit.nvim", event = "VeryLazy" },
  -- { "rhysd/clever-f.vim", event = "VeryLazy" },
  { "TheSafdarAwan/find-extender.nvim", event = "VeryLazy", branch = "alpha" },

  { "cbochs/grapple.nvim", event = "VeryLazy" },
  { "cbochs/portal.nvim", event = "VeryLazy" },
  -- { "LeonHeidelbach/trailblazer.nvim", event = "VeryLazy" },
  { "chentoast/marks.nvim", event = "VeryLazy" },
  { "aserowy/tmux.nvim", event = "VeryLazy" },

  { "kevinhwang91/nvim-bqf", event = "VeryLazy" },
  -- pretty list
  { "https://gitlab.com/yorickpeterse/nvim-pqf", event = "VeryLazy" },

  -- filetypes
  -- "ekickx/clipboard-image.nvim", -- copy clipboard image to nvim

  { "mtdl9/vim-log-highlighting", ft = "log", event = "VeryLazy" },
  { "chrisbra/csv.vim", ft = { "csv", "dat" }, event = "VeryLazy" },
  { "ledger/vim-ledger", ft = "ledger", event = "VeryLazy" },
  -- "kmonad/kmonad-vim",

  -- preview markdown
  { "ellisonleao/glow.nvim", ft = "markdown", event = "VeryLazy" },

  -- task runners
  { "michaelb/sniprun", build = "bash ./install.sh", event = "VeryLazy" },
  { "CRAG666/code_runner.nvim", event = "VeryLazy" },
  -- TODO: configure
  -- "stevearc/overseer.nvim",

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

  { "gbprod/substitute.nvim", event = "VeryLazy" },
  { "gbprod/cutlass.nvim", event = "VeryLazy" },
  { "gbprod/stay-in-place.nvim", event = "VeryLazy" },
  { "booperlv/nvim-gomove", event = "VeryLazy" },
  -- { "gbprod/yanky.nvim", event = "VeryLazy" },
  { "gelguy/wilder.nvim", event = "VeryLazy" },

  -- { "ja-ford/delaytrain.nvim", event = "VeryLazy" },

  -- find and replace
  { "nvim-pack/nvim-spectre", event = "VeryLazy" },

  { "mg979/vim-visual-multi", event = "VeryLazy" },

  { "chrisgrieser/nvim-recorder", event = "VeryLazy" },
  -- "smjonas/live-command.nvim",

  -- aesthetics
  { "rcarriga/nvim-notify", event = "VeryLazy" },
  -- smooth scrolling
  { "declancm/cinnamon.nvim", event = "VeryLazy" },
  -- flash cursor when jumping
  { "danilamihailov/beacon.nvim", event = "VeryLazy" },

  -- scrollbar
  { "petertriho/nvim-scrollbar", event = "VeryLazy" },
  -- scrollable bar
  { "dstein64/nvim-scrollview", event = "VeryLazy" },

  {
    "tummetott/reticle.nvim",
    event = "VeryLazy",
    config = function()
      require("reticle").setup({})
    end,
  },

  -- highlighting other uses of the word under cursor
  { "RRethy/vim-illuminate", event = "VeryLazy" },

  -- floating statuslines
  { "b0o/incline.nvim", event = "VeryLazy" },

  -- create comment boxes
  { "LudoPinelli/comment-box.nvim", event = "VeryLazy" },

  { "folke/todo-comments.nvim", event = "VeryLazy" },
  -- "folke/noice.nvim",

  -- note-taking/task management
  -- markdown conflicting with vim-wiki
  { "jakewvincent/mkdnflow.nvim", ft = "markdown", event = "VeryLazy" },
  {
    "chrishrb/gx.nvim",
    event = { "VeryLazy", "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true, -- default settings
  },

  -- "vimwiki/vimwiki",
  -- "tools-life/taskwiki",

  -- better search results
  { "kevinhwang91/nvim-hlslens", event = "VeryLazy" },
  -- "romainl/vim-cool", -- using `nvim-hlslens`

  -- see register contents
  { "tversteeg/registers.nvim", event = "VeryLazy" },

  -- `<C-w>o` maximizes window without closing other buffers
  { "nyngwang/NeoZoom.lua", event = "VeryLazy" },

  -- open files at last edit position
  "ethanholz/nvim-lastplace",

  { "max397574/colortils.nvim", event = "VeryLazy" },
  { "norcalli/nvim-colorizer.lua", event = "VeryLazy" },

  {
    "glacambre/firenvim",
    event = "VeryLazy",
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    cond = not not vim.g.started_by_firenvim,
    build = function()
      require("lazy").load({ plugins = "firenvim", wait = true, lazy = true })
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
  "rebelot/kanagawa.nvim",
  -- "EdenEast/nightfox.nvim", -- used by firenvim
  -- "rmehri01/onenord.nvim",
  -- "folke/tokyonight.nvim",
  -- "catppuccin/nvim",
  -- "NTBBloodbath/doom-one.nvim",
}, {
  defaults = { lazy = true },
  checker = { enabled = true, notify = false },
  debug = false,
  ui = { border = "rounded" },
})
