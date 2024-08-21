return {
  "williamboman/mason.nvim",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "jay-babu/mason-nvim-dap.nvim" },
  },
  config = function()
    require("mason").setup({
      ui = { border = "rounded" },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        -- "angularls",
        "cssls",
        "emmet_ls",
        "awk_ls",
        "bashls",
        -- "cssmodules_ls",
        "dockerls",
        "eslint", -- instead of `tsserver` or `eslint_d` in `null_ls` for better linting and react-specific linting rules
        "html",
        "lemminx",
        "pyright",
        "sqlls",
        "jsonls",
        "yamlls",
        "terraformls",
      },
      automatic_installation = true,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "eslint-lsp",
        "prettier",
        "awk-language-server",
        "bash-language-server",
        "css-lsp",
        -- "cssmodules-language-server",
        "dockerfile-language-server",
        "emmet-ls",
        "html-lsp",
        "json-lsp",
        "lemminx",
        "lua-language-server",
        -- sql
        "sqlls",
        "sql-formatter",
        -- python
        "pyright",
        "ruff",
        --  terraform
        -- "tfsec",
        -- "tflint",
      },
      auto_update = true,
    })

    require("mason-nvim-dap").setup({
      automatic_installation = false,
      ensure_installed = {
        -- Due to a bug with the latest version of vscode-js-debug, need to lock to specific version
        -- See: https://github.com/mxsdev/nvim-dap-vscode-js/issues/58#issuecomment-2213230558
        "js@v1.76.1",
      },
    })
  end,
}
