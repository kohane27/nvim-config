return {
  "booperlv/nvim-gomove",
  event = "VeryLazy",
  opts = {
    map_defaults = false,
    reindent = true, -- reindent lines moved vertically
    undojoin = true, -- undojoin same direction moves
    move_past_end_col = false, -- move past end column when moving blocks horizontally
  },
  config = function(_, opts)
    require("gomove").setup(opts)

    local map = vim.api.nvim_set_keymap
    map("x", "<C-h>", "<Plug>GoVSMLeft", {})
    map("x", "<C-j>", "<Plug>GoVSMDown", {})
    map("x", "<C-k>", "<Plug>GoVSMUp", {})
    map("x", "<C-l>", "<Plug>GoVSMRight", {})
  end,
}
