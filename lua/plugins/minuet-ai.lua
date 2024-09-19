return {
  "milanglacier/minuet-ai.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  opts = {
    provider = "claude",
    proxy = "http://127.0.0.1:8888",
    notify = "error",
  },
}
