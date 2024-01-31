return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    require("todo-comments").setup(opts)
  end,
}
