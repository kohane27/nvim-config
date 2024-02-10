return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    user_default_options = {
      names = false,
      rgb_fn = true,
      hsl_fn = true,
      tailwind = "both",
    },
    buftypes = {},
  },

  config = function(_, opts)
    require("colorizer").setup(opts)
  end,
}
