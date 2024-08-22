return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text", config = true },
  },
  config = function()
    local dap = require("dap")

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          -- os.getenv("HOME") .. "/repo/important/js-debug-dap/js-debug/src/dapDebugServer.js",
          os.getenv("VSCODE_JS_DEBUG_PATH") .. "/js-debug/dist/src/dapDebugServer.js",
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
