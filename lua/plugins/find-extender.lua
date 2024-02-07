-- "ggandor/flit.nvim",
-- "rhysd/clever-f.vim",
return {
  -- fix: jumping backwards
  "kohane27/find-extender.nvim",
  event = "VeryLazy",
  opts = {
    ignore_case = true,
    movements = {
      min_matches = 1,
      highlight_match = { fg = "#000000", bg = "#CCFF88" },
      leap = {
        enable = true,
        symbols = "asdfghjkl;",
      },
    },
  },
  config = function(_, opts)
    require("find-extender").setup(opts)
  end,
}
