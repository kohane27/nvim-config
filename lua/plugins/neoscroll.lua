return {
  -- smooth scrolling
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  opts = {
    mappings = { "<C-u>", "<C-d>", "zz" },
    hide_cursor = false,
  },
  config = function(_, opts)
    require("neoscroll").setup(opts)
    local t = {}
    t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "200" } }
    t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "200" } }
    t["zz"] = { "zz", { "100" } }
    require("neoscroll.config").set_mappings(t)
  end,
}
