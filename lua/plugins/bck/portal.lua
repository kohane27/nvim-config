return {
  "cbochs/portal",
  event = "VeryLazy",
  opts = {
    max_results = 6,

    ---An ordered list of keys for labelling portals.
    ---Labels will be applied in order
    -- labels = { "j", "k", "h", "l", "a", "s", "d", "f" },

    --- Keys for exiting portal selection
    escape = {
      ["<esc>"] = true,
      ["<C-c>"] = true,
    },

    window_options = {
      relative = "cursor",
      width = 100,
      height = 6,
      col = 5,
    },
  },
  config = function(_, opts)
    require("portal").setup(opts)
  end,
}
