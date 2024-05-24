return {
  -- formatters and linters when LSP is not present
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  enabled = not vim.g.started_by_firenvim,
  dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  config = function()
    local null_ls = require("null-ls")

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    local sources = {
      formatting.prettier,

      -- linting: `sqlls`
      formatting.sql_formatter,

      -- Terraform
      formatting.terraform_fmt,
      diagnostics.terraform_validate,

      -- Lua
      formatting.stylua,

      -- shell
      formatting.shfmt.with({ extra_args = { "--indent", "4" } }),

      -- nix
      formatting.nixfmt,
    }
    require("null-ls").setup({
      debug = false,
      sources = sources,
    })
  end,
}
