return {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = { "nvimtools/hydra.nvim" },
  opts = {},
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  keys = {
    {
      mode = { "n", "v" },
      "<C-n>",
      "<cmd>MCstart<cr>",
      desc = "Create a selection for selected text or word under the cursor",
    },

    -- create a column of cursors from visual mode
    -- "<C-S-n>",
    -- ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
  },
}
