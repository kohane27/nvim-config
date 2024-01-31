return {
  "gbprod/substitute.nvim",
  event = "VeryLazy",
  opts = {
    exchange = {
      motion = false,
      use_esc_to_cancel = true,
    },
  },
  config = function(_, opts)
    require("substitute").setup(opts)
  end,
}
