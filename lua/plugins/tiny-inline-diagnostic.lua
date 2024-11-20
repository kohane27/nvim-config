return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    options = {
      -- Show the source of the diagnostic.
      show_source = false,

      -- If multiple diagnostics are under the cursor, display all of them.
      multiple_diag_under_cursor = false,

      -- Enable diagnostic message on all lines.
      multilines = false,

      -- Show all diagnostics on the cursor line.
      show_all_diags_on_cursorline = false,
    },
  },
}
