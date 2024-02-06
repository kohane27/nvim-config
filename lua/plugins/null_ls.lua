-- formatters and linters when LSP is not present
return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "awk-language-server",
        "bash-language-server",
        "css-lsp",
        "cssmodules-language-server",
        "dockerfile-language-server",
        "emmet-ls",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "lemminx",
        "lua-language-server",
        "pyright",
        "python-lsp-server",
        "sqlls",
        "prettierd",
        "sql-formatter",
      },
      auto_update = true,
    })

    local null_ls = require("null-ls")
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics
    local sources = {
      formatting.prettierd,

      -- linting: `sqlls`
      formatting.sql_formatter,

      -- linting: `pylsp`
      formatting.black,

      -- Lua
      formatting.stylua,

      -- shell
      formatting.shfmt.with({ extra_args = { "--indent", "4" } }),

      -- `bashls` works with `shellcheck`
      diagnostics.shellcheck,
      -- TODO: check other diagnostics
      -- `null-ls` has a built-in source `null_ls.builtins.diagnostics.tsc` that provides workspace diagnostics
      -- typescript
      diagnostics.tsc,
    }
    require("null-ls").setup({
      debug = false,
      sources = sources,
    })
  end,
}
