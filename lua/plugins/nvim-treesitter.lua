return {
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  event = "VeryLazy",
  build = ":TSUpdate",
  opts = {
    ensure_installed = "all",
    sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- parsers to ignore installing
    highlight = {
      enable = true,
      -- disable = { "yaml", "json" },
      additional_vim_regex_highlighting = { "org" },
    },
    autopairs = { enable = true },
    indent = { enable = true, disable = { "yaml", "json" } },
    incremental_selection = {
      -- using `flash.nvim`
      enable = false,
      keymaps = {
        -- set to `false` to disable one of the mappings
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = false,
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- jump forward to textobj
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",

          -- don't like selecting the block including the symbol
          -- ["ab"] = "@block.outer",
          -- ["ib"] = "@block.inner",
        },
      },
      swap = { enable = false },
      move = { enable = false },

      -- andymass/vim-matchup
      -- mandatory, `false` will disable the whole extension
      matchup = { enable = true },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
