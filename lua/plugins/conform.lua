return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "isort", "black" },
      -- customize format options for the filetype (:help conform.format)
      rust = { "rustfmt" },
      go = { "gofmt" },
      -- Conform will run the first available formatter
      javascript = { "prettier", stop_after_first = true },
      javascriptreact = { "prettier", stop_after_first = true },
      typescript = { "prettier", stop_after_first = true },
      typescriptreact = { "prettier", stop_after_first = true },
      terraform = { "terraform_fmt" },
      sql = { "sql_formatter" },
      nix = { "nixfmt" },
      sh = { "shfmt" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "--indent", "2" },
      },
      -- prettier = {
      --   command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/prettier",
      -- },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
