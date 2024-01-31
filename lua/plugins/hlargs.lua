return {
  "m-demare/hlargs.nvim",
  event = "VeryLazy",
  opts = {
    color = "#DCA561", -- autumnYellow
  },
  config = function(_, opts)
    require("hlargs").setup(opts)
  end,
}
