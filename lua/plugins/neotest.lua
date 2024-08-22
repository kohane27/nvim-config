return {
  "nvim-neotest/neotest",
  event = "VeryLazy",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      discovery = { enabled = false },
      status = { virtual_text = true },
      output = { open_on_run = true },
      quickfix = {
        open = function()
          require("trouble").open({ mode = "quickfix", focus = false })
        end,
      },
      adapters = {
        require("neotest-jest")({
          jest_test_discovery = false,
          jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h")) .. " --watch",
        }),
      },
    })
  end,
}
