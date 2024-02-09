return {
  "cbochs/grapple.nvim",
  event = "VeryLazy",
  config = function()
    require("grapple").setup({})
  end,

  -- -- ╭──────────────────────────────────────────────────────────╮
  -- -- │  Grapple                                                 │
  -- -- ╰──────────────────────────────────────────────────────────╯
  -- { "gj", toolbox.lazy_required_fn("grapple", "cycle_forward"), description = "Grapple: Cycle Forward" },
  -- {
  --   "gk",
  --   toolbox.lazy_required_fn("grapple", "cycle_backward"),
  --   description = "Grapple: Cycle Backward",
  -- },
  -- { "mm", toolbox.lazy_required_fn("grapple", "popup_tags"), description = "Grapple: View All Tags" },
  -- { "MM", toolbox.lazy_required_fn("grapple", "toggle"), description = "Grapple: Tag or Untag File" },
  -- { "m1", "<cmd>lua require('grapple').select({key = 1})<CR>", description = "Grapple: File 1" },
  -- { "m2", "<cmd>lua require('grapple').select({key = 2})<CR>", description = "Grapple: File 2" },
  -- { "m3", "<cmd>lua require('grapple').select({key = 3})<CR>", description = "Grapple: File 3" },
  -- { "m4", "<cmd>lua require('grapple').select({key = 4})<CR>", description = "Grapple: File 4" },
  -- { "m5", "<cmd>lua require('grapple').select({key = 5})<CR>", description = "Grapple: File 5" },
  -- { "m6", "<cmd>lua require('grapple').select({key = 6})<CR>", description = "Grapple: File 6" },
}
