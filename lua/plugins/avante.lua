return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make BUILD_FROM_SOURCE=true luajit",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    {
      "grapp-dev/nui-components.nvim",
      dependencies = { "MunifTanjim/nui.nvim" },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "Avante" } },
      ft = { "Avante" },
    },
  },
  opts = {
    provider = "claude",
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-5-sonnet-20240620",
      proxy = "http://127.0.0.1:8888",
      -- allow_insecure = false,
    },
    hints = { enabled = false },
  },
}
