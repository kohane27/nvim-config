local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local nls_utils = require("null-ls.utils")
local builtins = null_ls.builtins

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local sources = {

  formatting.prettier.with({
    disabled_filetypes = { "json" }, -- use `jsonls`
    -- extra_args = { "--single-quote", "--jsx-single-quote" },
  }),

  -- eslint not suitable for formatting on save. Use eslint_d
  formatting.eslint_d,
  diagnostics.eslint_d,

  -- css
  formatting.stylelint,
  diagnostics.stylelint,

  -- format and lint
  formatting.xmllint,

  -- SQL
  formatting.sql_formatter,

  -- Python
  formatting.black.with({ extra_args = { "--fast" } }),
  diagnostics.pylint,

  -- Lua
  formatting.stylua.with({
    extra_args = { "--indent-type", "Spaces", "--indent-width", "2", "--line-endings", "Unix" },
  }),

  -- shell
  formatting.shfmt.with({ extra_args = { "-i", "2" } }),
  diagnostics.shellcheck.with({
    filetypes = { "sh", "bash", "zsh" },
  }),

  -- diagnostics.tsc,
  -- diagnostics.markdownlint,
  -- diagnostics.flake8,

  -- CODE ACTIONS
  builtins.code_actions.gitsigns,
  builtins.code_actions.gitrebase,
  -- injects actions to fix ESLint issues or ignore broken rules
  builtins.code_actions.eslint_d,
}

null_ls.setup({
  debug = false,
  sources = sources,
  root_dir = nls_utils.root_pattern(".git"),
})
