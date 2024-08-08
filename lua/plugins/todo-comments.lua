return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*]], -- NOTE: match without the extra colon. You'll likely get false positives
    },
  },
}
