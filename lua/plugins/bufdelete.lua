return {
  -- preserve layouts when deleting buffers
  -- TODO: do I need it? maybe it'll release keybinding `Q`?
  -- { "<leader>q", "<cmd>wqa<CR>", description = "Quit" },
  -- { "<leader>Q", "<cmd>q!<CR>", description = "Force Quit" },
  -- { "qq", "<cmd>Bdelete<CR>", description = "Buffer: Close" },
  -- { "Q", "<cmd>close<CR>", description = "Window: Close" },
  "famiu/bufdelete.nvim",
  event = "VeryLazy",
}
