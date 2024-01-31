return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  config = function()
    require("diffview").setup({})
  end,
}
