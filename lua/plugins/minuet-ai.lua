return {
  "milanglacier/minuet-ai.nvim",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  opts = {
    provider = "claude",
    proxy = "http://127.0.0.1:8888",
    notify = "error",
    provider_options = {
      claude = {
        model = "claude-3-5-haiku-20241022",
      },
    },
  },
}
