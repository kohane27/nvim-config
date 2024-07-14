return {
  "JMarkin/nvim-tree.lua-float-preview",
  lazy = true,
  opts = {
    -- don't enabled by default
    toggled_on = false,
    window = {
      open_win_config = function()
        return {
          anchor = "NW",
          style = "minimal",
          relative = "editor",
          border = "rounded",
          row = 1,
          col = require("nvim-tree.view").View.width + 1,
          width = math.floor(vim.o.columns * 0.6), -- 60% of total width
          height = vim.o.lines - 5, -- almost full height
        }
      end,
    },
    mapping = {
      up = {},
      down = {},
      toggle = { "P" },
    },
  },
}
