-- floating statuslines
return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  opts = {
    hide = {
      cursorline = true,
      focused_win = false,
      only_win = true,
    },
  },
  config = function(_, opts)
    require("incline").setup(opts)
  end,
}
