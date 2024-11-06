return {
  "andrewferrier/debugprint.nvim",
  opts = {
    keymaps = {
      insert = {
        plain = "<C-G>p",
        variable = "<C-G>v",
      },
      normal = {
        plain_below = "<leader>pp",
        plain_above = "<leader>pP",
        variable_below = "<leader>pv",
        variable_above = "<leader>pV",
        variable_above_alwaysprompt = nil,
        textobj_below = nil,
        textobj_above = nil,
        toggle_comment_debug_prints = nil,
        delete_debug_prints = nil,
      },
      visual = {
        variable_below = nil,
        variable_above = nil,
      },
    },
  },
}
