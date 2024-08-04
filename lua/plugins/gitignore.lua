return {
  "wintermute-cell/gitignore.nvim",
  event = "VeryLazy",
  config = function(_, _)
    require("gitignore")
  end,
}
