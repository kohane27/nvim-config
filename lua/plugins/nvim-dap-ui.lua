return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  enabled = not vim.g.started_by_firenvim,
  dependencies = { "mfussenegger/nvim-dap" },
  -- stylua: ignore
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
  end,
}
