return {
  "williamboman/mason.nvim",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = {} },
  },
  config = function()
    require("mason").setup({
      ui = { border = "rounded" },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
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
        -- "nil_ls", -- nix
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
  end,
}
