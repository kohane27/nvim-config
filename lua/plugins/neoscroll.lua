return {
  -- stylua: ignore
  -- smooth scrolling
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  opts = {
    mappings = { "<C-u>", "<C-d>", "zz" },
    hide_cursor = false,
  },
  -- stylua: ignore
  config = function(_, opts)
    local neoscroll = require("neoscroll")
    neoscroll.setup(opts)
    local keymap = {
      ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 200 }) vim.cmd("normal m'") end,
      ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 200 }) vim.cmd("normal m'") end,
    }
    local modes = { "n", "v", "x" }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
