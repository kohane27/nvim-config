return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },

      lua = { "stylua" },
      nix = { "nixfmt" },
      sh = { "shfmt" },
      terraform = { "terraform_fmt" },

      -- run multiple formatters sequentially
      rust = { "rustfmt" },
      go = { "gofmt" },
      python = { "isort", "black" },
      -- run the first available formatter
      sql = { "sql_formatter", stop_after_first = true },
    },
    formatters = {
      shfmt = {
        prepend_args = { "--indent", "2" },
      },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = {
      -- prettier is slow
      timeout_ms = 5000,
      lsp_format = "fallback",
    },
  },
}
