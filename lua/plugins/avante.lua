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
    hints = { enabled = false },
  },
}
