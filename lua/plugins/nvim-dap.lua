return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    { "theHamsta/nvim-dap-virtual-text", config = true },
    { "rcarriga/nvim-dap-ui", config = true },
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
          -- TODO: make it work: https://github.com/NixOS/nixpkgs/blob/a0d6390cb3e82062a35d0288979c45756e481f60/pkgs/by-name/vs/vscode-js-debug/package.nix#L79
          os.getenv("HOME") .. "/repo/important/js-debug-dap/js-debug/src/dapDebugServer.js",
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
