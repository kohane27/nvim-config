return {
  "sourcegraph/sg.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    require("sg").setup({})
  end,
}
