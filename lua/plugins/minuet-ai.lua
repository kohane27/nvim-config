return {
  "milanglacier/minuet-ai.nvim",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  opts = {
    provider = "gemini",
    proxy = "http://127.0.0.1:8888",
    notify = "warn",
    provider_options = {
      gemini = {
        model = "gemini-1.5-flash-latest",
      },
      -- claude = {
      --   model = "claude-3-5-haiku-latest",
      -- },
    },
  },
}
