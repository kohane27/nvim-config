return {
  -- smooth scrolling
  "declancm/cinnamon.nvim",
  event = "VeryLazy",
  opts = {
    -- KEYMAPS:
    default_keymaps = true,
    extra_keymaps = false,
    extended_keymaps = false,
    override_keymaps = false,
    -- OPTIONS:
    centered = true,
    default_delay = 12, -- delay (in ms) between each line when scrolling.
    always_scroll = false, -- Scroll the cursor even when the window hasn't scrolled.
    horizontal_scroll = false, -- Enable smooth horizontal scrolling when view shifts left or right.
    max_length = -1, -- Maximum length (in ms) of a command. The line delay will be re-calculated. Setting to -1 to disable it
    scroll_limit = 50, -- Max number of lines moved before scrolling is skipped. Setting -1 to disable it
  },
  config = function(_, opts)
    require("cinnamon").setup(opts)
  end,
}
