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
  { "ahmedkhalf/project.nvim" },
  -- "nvim-telescope/telescope-project.nvim", -- using project.nvim
  -- clipboard manager
  { "AckslD/nvim-neoclip.lua", dependencies = { "kkharji/sqlite.lua" } },
  -- `:oldfiles` but for directories
  { "marcuscaisey/olddirs.nvim" },
  { "nvim-telescope/telescope-frecency.nvim", dependencies = { "kkharji/sqlite.lua" } },

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
  -- enhanced with `nvim-treesitter-textobjects`
  { "andymass/vim-matchup" }, -- can't lazy load
  -- { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },
  { "windwp/nvim-ts-autotag" },
  -- integrated with cmp and treesitter
  { "windwp/nvim-autopairs" },
  -- rainbow parentheses
  { "hiphish/rainbow-delimiters.nvim" },
  -- indentation guides
  { "lukas-reineke/indent-blankline.nvim" },
  { "mizlan/iswap.nvim" },
  { "monaqa/dial.nvim" },

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

  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  -- language server settings defined in json
  { "tamago324/nlsp-settings.nvim" },

  -- formatters and linters when LSP is not present
  { "jose-elias-alvarez/null-ls.nvim" },

  -- "rmagatti/goto-preview",
  { "nvimdev/lspsaga.nvim" },

  { "folke/trouble.nvim" },

  -- pictograms
  { "onsails/lspkind.nvim" },

  -- LSP diagnostics highlight groups
  { "folke/lsp-colors.nvim" },

  -- "simrat39/symbols-outline.nvim", -- using `lspsaga`
  -- "ray-x/lsp_signature.nvim", -- usine `lspsaga`
  { "b0o/schemastore.nvim"},
  { "mfussenegger/nvim-jdtls", ft = "java" },
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
    event = "InsertCharPre",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- provided snippets
      "saadparwaiz1/cmp_luasnip", -- completion engine
    },
  },

  -- General
  -- "ibhagwan/fzf-lua", -- for `:changes`
  { "tpope/vim-repeat" },
  { "numToStr/Comment.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-tree/nvim-tree.lua" },
  -- buffers
  { "akinsho/bufferline.nvim" },
  -- preserve layouts when deleting buffers
  { "famiu/bufdelete.nvim" },
  -- `<C-w>o` maximizes window without closing other buffers
  { "nyngwang/NeoZoom.lua" },

  -- "nvim-lualine/lualine.nvim", -- statusline
  { "freddiehaddad/feline.nvim" },

  -- terminal
  { "akinsho/toggleterm.nvim" },

  -- `ranger`
  -- { "is0n/fm-nvim" },
  { "kelly-lin/ranger.nvim" },

  { "kdheepak/lazygit.nvim" },

  { "kylechui/nvim-surround" },
  -- "machakann/vim-sandwich",

  -- "abecodes/tabout.nvim", -- tabbing out from parentheses and quotes
  -- "wellle/targets.vim", -- superseded by `nvim-treesitter-textobjects`
  { "mbbill/undotree" },

  { "https://git.sr.ht/~nedia/auto-save.nvim" },

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

  { "mrjones2014/legendary.nvim" },
  { "stevearc/dressing.nvim" },
  { "lewis6991/gitsigns.nvim" },

  -- navigation
  { "ggandor/leap.nvim" },
  -- { "ggandor/leap-spooky.nvim" },
  -- { "ggandor/flit.nvim" },
  -- { "rhysd/clever-f.vim" },
  { "TheSafdarAwan/find-extender.nvim", branch = "alpha" },

  { "cbochs/grapple.nvim" },
  { "cbochs/portal.nvim" },
  -- { "LeonHeidelbach/trailblazer.nvim" },
  { "chentoast/marks.nvim" },
  { "aserowy/tmux.nvim" },

  { "kevinhwang91/nvim-bqf" },
  -- pretty list
  { "https://gitlab.com/yorickpeterse/nvim-pqf" },

  -- filetypes
  -- "ekickx/clipboard-image.nvim", -- copy clipboard image to nvim

  { "mtdl9/vim-log-highlighting", ft = "log" },
  { "chrisbra/csv.vim", ft = { "csv", "dat" } },
  { "ledger/vim-ledger", ft = "ledger" },
  -- "kmonad/kmonad-vim",

  -- preview markdown
  { "ellisonleao/glow.nvim", ft = "markdown" },

  -- task runners
  { "michaelb/sniprun", build = "bash ./install.sh" },
  { "CRAG666/code_runner.nvim" },
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

  { "gbprod/substitute.nvim" },
  { "gbprod/cutlass.nvim" },
  { "gbprod/stay-in-place.nvim" },
  { "booperlv/nvim-gomove" },
  -- { "gbprod/yanky.nvim" },
  { "gelguy/wilder.nvim" },

  -- { "ja-ford/delaytrain.nvim" },

  -- find and replace
  { "nvim-pack/nvim-spectre" },

  { "mg979/vim-visual-multi" },

  { "chrisgrieser/nvim-recorder" },
  -- "smjonas/live-command.nvim",

  -- aesthetics
  { "rcarriga/nvim-notify" },
  -- smooth scrolling
  { "declancm/cinnamon.nvim" },
  -- flash cursor when jumping
  { "danilamihailov/beacon.nvim" },

  -- scrollbar
  { "petertriho/nvim-scrollbar" },
  -- scrollable bar
  { "dstein64/nvim-scrollview" },

  {
    "tummetott/reticle.nvim",
    event = "VeryLazy",
    config = function()
      require("reticle").setup({})
    end,
  },

  -- highlighting other uses of the word under cursor
  { "RRethy/vim-illuminate" },

  -- floating statuslines
  { "b0o/incline.nvim" },

  -- create comment boxes
  { "LudoPinelli/comment-box.nvim" },

  { "folke/todo-comments.nvim" },
  -- "folke/noice.nvim",

  -- note-taking/task management
  -- markdown conflicting with vim-wiki
  { "jakewvincent/mkdnflow.nvim", ft = "markdown" },
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },

  -- "vimwiki/vimwiki",
  -- "tools-life/taskwiki",

  -- better search results
  { "kevinhwang91/nvim-hlslens" },
  -- "romainl/vim-cool", -- using `nvim-hlslens`

  -- see register contents
  { "tversteeg/registers.nvim" },

  -- open files at last edit position
  "ethanholz/nvim-lastplace",

  { "max397574/colortils.nvim" },
  { "norcalli/nvim-colorizer.lua" },

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
  checker = { enabled = true, notify = false },
  debug = false,
  ui = { border = "rounded" },
})
