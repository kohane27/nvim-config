return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  build = "make",
  -- build = "make BUILD_FROM_SOURCE=true luajit",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "Avante" }, latex = { enabled = false } },
      ft = { "Avante" },
    },
  },
  opts = {
    provider = "claude",
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-5-sonnet-latest",
      proxy = "http://127.0.0.1:8888",
    },
    hints = { enabled = false },
    mappings = {
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = ";x",
        prev = ",x",
      },
      jump = {
        next = ";x",
        prev = ",x",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
    windows = {
      width = 40, -- default % based on available width
      sidebar_header = {
        enabled = true,
      },
    },
  },
  config = function(_, opts)
    require("avante").setup(opts)
    vim.api.nvim_set_hl(0, "AvanteTitle", { fg = "#ABB2BF", bg = "#353B45" })
    vim.api.nvim_set_hl(0, "AvanteReversedTitle", { fg = "#353B45" })
    vim.api.nvim_set_hl(0, "AvanteSubtitle", { fg = "#ABB2BF", bg = "#353B45" })
    vim.api.nvim_set_hl(0, "AvanteReversedSubtitle", { fg = "#353B45" })
  end,
}
