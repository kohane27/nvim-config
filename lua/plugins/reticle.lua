return {
  "tummetott/reticle.nvim",
  opts = {
    on_startup = {
      cursorline = true,
    },
  },
  config = function(_, opts)
    require("reticle").setup(opts)
  end,
}
