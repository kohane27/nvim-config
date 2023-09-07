local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- local nls_utils = require("null-ls.utils")
-- local builtins = null_ls.builtins

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
  formatting.shfmt,

  -- `bashls` works with `shellcheck`
  diagnostics.shellcheck,
}

null_ls.setup({
  debug = false,
  sources = sources,
})
