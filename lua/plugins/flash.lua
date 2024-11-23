return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    labels = "jklasdfghqwertyuiopzxcvbnm",
    highlight = {
      -- show a backdrop
      backdrop = false,
      -- Highlight the search matches
      matches = true,
      groups = {
        match = "FlashMatch",
        current = "FlashCurrent",
        backdrop = "FlashBackdrop",
        label = "FlashLabel",
      },
    },
    modes = {
      -- regular search with `/` or `?`
      search = { enabled = false },
      -- `f`, `F`, `t`, `T`, `;` and `,` motions
      char = { enabled = false },
      -- `require("flash").treesitter()`
      treesitter = {
        labels = "jklasdfghqwertyuiopzxcvbnm",
        label = { before = true, after = false, style = "inline" },
        highlight = {
          backdrop = false,
          matches = false,
        },
      },
    },
  },
  config = function(_, opts)
    require("flash").setup(opts)
    -- search Treesitter nodes
    -- consistent with `leap.nvim`
    vim.cmd("highlight FlashLabel guifg=#000000 guibg=#CCFF88 gui=bold,nocombine")

    -- disable remote operation
    require("core.utils").map("n", "yr", "", { noremap = true, silent = true, buffer = 0 })
    require("core.utils").map("n", "ys", "", { noremap = true, silent = true, buffer = 0 })
  end,
}
