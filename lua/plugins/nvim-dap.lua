return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  enabled = not vim.g.started_by_firenvim,
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    { "rcarriga/nvim-dap-ui", config = true },
    { "theHamsta/nvim-dap-virtual-text", opts = { virt_text_pos = "eol" } },
  },

  -- stylua: ignore
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    local js_based_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          cwd = "${workspaceFolder}",
        },
      }
    end
  end,
}
