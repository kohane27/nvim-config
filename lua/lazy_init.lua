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
  { "nvim-telescope/telescope.nvim", dependencies = { "romgrk/fzy-lua-native" } },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  -- Telescope extensions
  -- "ahmedkhalf/project.nvim",
  "jvgrootveld/telescope-zoxide",
  {
    "nvim-telescope/telescope-frecency.nvim",
    -- error: sql statement parse, , stmt: `sel
    commit = "0a4a521471141ae3c94ff0ebcffcaff3c3aad147",
    dependencies = { "kkharji/sqlite.lua" },
  },
  -- better `live_grep`
  {
    "fdschmidt93/telescope-egrepify.nvim",
    event = "VeryLazy",
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
  },

  { "JoosepAlviste/nvim-ts-context-commentstring", commit = "6c30f3c8915d7b31c3decdfe6c7672432da1809d" },
  -- can't lazy load
  { "andymass/vim-matchup", dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" } },

  -- { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },

  "windwp/nvim-ts-autotag",

  -- integrated with cmp and treesitter
  "windwp/nvim-autopairs",

  -- rainbow parentheses
  "hiphish/rainbow-delimiters.nvim",

  {
    "m-demare/hlargs.nvim",
    config = function()
      require("hlargs").setup({
        color = "#DCA561", -- autumnYellow
      })
    end,
  },

  -- indentation guides
  -- TODO: migrate to v3
  { "lukas-reineke/indent-blankline.nvim", commit = "9637670896b68805430e2f72cf5d16be5b97a22a" },

  "mizlan/iswap.nvim",
  "monaqa/dial.nvim",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  -- language server settings in json
  "tamago324/nlsp-settings.nvim",

  -- formatters and linters when LSP is not present
  "nvimtools/none-ls.nvim",

  -- "rmagatti/goto-preview",
  "nvimdev/lspsaga.nvim",

  "folke/trouble.nvim",

  -- pictograms
  "onsails/lspkind.nvim",

  -- LSP diagnostics highlight groups
  "folke/lsp-colors.nvim",

  -- "hedyhli/outline.nvim", -- using `lspsaga`
  -- "ray-x/lsp_signature.nvim", -- usine `lspsaga`
  "b0o/schemastore.nvim",
  { "mfussenegger/nvim-jdtls", ft = "java" },
  "pmizio/typescript-tools.nvim",

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
    event = "InsertCharPre",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- provided snippets
      "saadparwaiz1/cmp_luasnip", -- completion engine
    },
  },

  -- General
  "tpope/vim-repeat",
  "numToStr/Comment.nvim",
  "nvim-tree/nvim-web-devicons",

  -- tree
  "nvim-tree/nvim-tree.lua",
  "stevearc/oil.nvim",

  -- buffers
  "akinsho/bufferline.nvim",

  -- preserve layouts when deleting buffers
  "famiu/bufdelete.nvim",

  -- scoped buffers
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup({})
    end,
  },

  -- `<C-w>o` maximizes window without closing other buffers
  "nyngwang/NeoZoom.lua",

  "nvim-lualine/lualine.nvim", -- statusline
  "freddiehaddad/feline.nvim",

  -- terminal
  { "akinsho/toggleterm.nvim", version = "*" },

  -- `ranger`
  -- "is0n/fm-nvim",
  "kelly-lin/ranger.nvim",

  "kdheepak/lazygit.nvim",

  -- "machakann/vim-sandwich",
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    dependencies = {
      -- fix: https://github.com/kylechui/nvim-surround/issues/153
      -- and more text objects
      "wellle/targets.vim",
    },
  },

  -- "abecodes/tabout.nvim", -- tabbing out from parentheses and quotes
  "mbbill/undotree",

  "https://git.sr.ht/~nedia/auto-save.nvim",
  {
    "https://git.sr.ht/~nedia/auto-format.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    event = "BufReadPre",
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
  {
    "kevinhwang91/nvim-fundo",
    dependencies = "kevinhwang91/promise-async",
    build = function()
      require("fundo").install()
    end,
    config = function()
      require("fundo").setup()
    end,
  },

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },
  -- "akinsho/git-conflict.nvim",

  -- {
  --   "dstein64/vim-startuptime",
  --   cmd = "StartupTime",
  -- },

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
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
  },

  -- search Treesitter nodes
  {
    "folke/flash.nvim",
    event = "VeryLazy",
  },

  -- "ggandor/flit.nvim",
  -- "rhysd/clever-f.vim",
  {
    "kohane27/find-extender.nvim",
    event = "VeryLazy",
  },
  {
    "rasulomaroff/telepath.nvim",
    event = "VeryLazy",
  },
  -- "ggandor/leap-spooky.nvim",

  -- "tpope/vim-unimpaired",
  {
    "nvim-island/hydra.nvim",
    event = "VeryLazy",
  },
  {
    "cbochs/grapple.nvim",
    event = "VeryLazy",
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
  },
  "aserowy/tmux.nvim",

  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    dependencies = { "junegunn/fzf" },
    ft = "qf",
  },

  -- filetypes
  -- "ekickx/clipboard-image.nvim", -- copy clipboard image to nvim

  { "mtdl9/vim-log-highlighting", ft = "log", event = "VeryLazy" },
  { "chrisbra/csv.vim", ft = { "csv", "dat" }, event = "VeryLazy" },
  { "ledger/vim-ledger", ft = "ledger", event = "VeryLazy" },

  {
    "LintaoAmons/scratch.nvim",
    event = "VeryLazy",
  },

  -- task runners
  { "michaelb/sniprun", build = "bash ./install.sh" },
  "CRAG666/code_runner.nvim",
  -- "stevearc/overseer.nvim",

  {
    "kohane27/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  -- {
  --   "robitx/gp.nvim",
  --   event = "VeryLazy",
  -- },
  --
  -- {
  --   "gsuuon/llm.nvim",
  --   event = "VeryLazy",
  -- },

  "gbprod/substitute.nvim",
  "gbprod/cutlass.nvim",
  "gbprod/stay-in-place.nvim",
  "booperlv/nvim-gomove",
  -- "gbprod/yanky.nvim",
  "gelguy/wilder.nvim",

  -- {
  --   "ja-ford/delaytrain.nvim",
  --   event = "VeryLazy",
  -- },
  {
    "arthurxavierx/vim-caser",
    event = "VeryLazy",
  },

  -- find and replace
  { "nvim-pack/nvim-spectre", event = "VeryLazy" },

  "mg979/vim-visual-multi",

  "chrisgrieser/nvim-recorder",
  -- "smjonas/live-command.nvim",

  {
    "echasnovski/mini.trailspace",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.trailspace").setup()
    end,
  },

  { "echasnovski/mini.misc", version = false },
  -- {
  --   "echasnovski/mini.align",
  --   version = false,
  --   config = function()
  --     require("mini.align").setup({
  --       mappings = {
  --         start = "<leader>a",
  --         start_with_preview = "<leader>A",
  --       },
  --     })
  --   end,
  -- },

  {
    "tummetott/reticle.nvim",
    opts = {
      on_startup = {
        cursorline = true,
      },
    },
  },

  -- aesthetics
  "rcarriga/nvim-notify",
  -- smooth scrolling
  "declancm/cinnamon.nvim",
  -- flash cursor when jumping
  "danilamihailov/beacon.nvim",

  -- scrollbar
  "petertriho/nvim-scrollbar",
  -- scrollable bar
  "dstein64/nvim-scrollview",

  -- highlighting other uses of the word under cursor
  "RRethy/vim-illuminate",

  -- floating statuslines
  "b0o/incline.nvim",

  -- create comment boxes
  { "LudoPinelli/comment-box.nvim", event = "VeryLazy" },

  { "folke/todo-comments.nvim", event = "VeryLazy" },
  -- "folke/noice.nvim",

  -- note-taking/task management
  -- `mkdnflow` conflicting with `vim-wiki`
  -- { "jakewvincent/mkdnflow.nvim", ft = "markdown" },

  -- open links
  { "chrishrb/gx.nvim", event = "BufEnter" },

  -- "vimwiki/vimwiki",
  -- "tools-life/taskwiki",

  -- better search results
  "kevinhwang91/nvim-hlslens",

  -- see register contents
  "tversteeg/registers.nvim",

  "max397574/colortils.nvim",
  "norcalli/nvim-colorizer.lua",

  {
    "glacambre/firenvim",
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "javascript",
    },
  },

  -- debuggers
  -- "mfussenegger/nvim-dap",
  -- "rcarriga/nvim-dap-ui",
  -- "puremourning/vimspector",
  -- test
  -- "vim-test/vim-test",

  -- Colorschemes/themes
  "rebelot/kanagawa.nvim",
  "EdenEast/nightfox.nvim", -- used by firenvim
  -- "rmehri01/onenord.nvim",
  -- "folke/tokyonight.nvim",
  -- "catppuccin/nvim",
  -- "NTBBloodbath/doom-one.nvim",
}, {
  checker = { enabled = true, notify = false },
  debug = false,
  ui = { border = "rounded" },
})
