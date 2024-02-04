return {
  -- TODO: convert `migrate` file functionalities
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = {
    indent = {
      char = "▏",
      tab_char = "▏",
    },
    scope = {
      -- using treesitter instead of this
      enabled = false,
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)
  end,
}
