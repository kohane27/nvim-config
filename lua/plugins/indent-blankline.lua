return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = {
    indent = {
      char = "▏",
      tab_char = "▏",
    },
    scope = {
      -- use treesitter instead of this
      enabled = false,
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)
  end,
}
