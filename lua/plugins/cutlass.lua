return {
  "gbprod/cutlass.nvim",
  event = "VeryLazy",
  opts = {
    -- leap.nvim integration
    -- `nc` needed for `nvim-surround`'s `css` to work
    exclude = { "ns", "nS", "nd", "xd", "vd", "nD", "nc" },
  },
}
