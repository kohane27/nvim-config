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

  --FORMATTING
  formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
  formatting.black.with({ extra_args = { "--fast" } }),
  formatting.stylua.with({
    extra_args = { "--indent-type", "Spaces", "--indent-width", "2", "--line-endings", "Unix" },
  }),
  formatting.shfmt.with({ extra_args = { "-i", "2" } }),
  -- formatting.isort,

  -- DIAGNOSTICS
  diagnostics.shellcheck.with({
    filetypes = { "sh", "bash", "zsh" },
  }),
  -- diagnostics.write_good,
  -- diagnostics.markdownlint,
  -- diagnostics.flake8,
  -- diagnostics.tsc,
  -- diagnostics.eslint_d,
  -- diagnostics.pylint,

  -- CODE ACTIONS
  builtins.code_actions.gitsigns,
  builtins.code_actions.gitrebase,
}

null_ls.setup({
  debug = false,
  sources = sources,
  root_dir = nls_utils.root_pattern(".git"),
})
