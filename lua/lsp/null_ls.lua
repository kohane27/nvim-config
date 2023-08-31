local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- local nls_utils = require("null-ls.utils")
-- local builtins = null_ls.builtins

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

local sources = {

  -- formatting.prettier.with({
  --   disabled_filetypes = { "json", "html", "markdown" }, -- they're in `lsp_config.lua`
  --   extra_args = { "--tabWidth=2" }, -- "--semi=false"
  --   -- extra_args = { "--single-quote", "--jsx-single-quote" },
  -- }),

  -- use LSP in `lsp_config.lua`
  -- formatting.eslint_d,
  -- diagnostics.eslint_d,

  -- use LSP in `lsp_config.lua`
  -- formatting.stylelint,
  -- diagnostics.stylelint,

  -- use LSP in `lsp_config.lua`
  -- format and lint
  -- formatting.xmllint,

  -- use LSP in `lsp_config.lua`
  -- formatting.sql_formatter,

  -- Python (using pylsp)
  -- formatting.black.with({ extra_args = { "--fast" } }),
  -- always import error
  -- diagnostics.pylint,

  -- Lua
  formatting.stylua,
  -- shell
  formatting.shfmt.with({ extra_args = { "-i", "2" } }),

  -- use bashls
  -- diagnostics.shellcheck.with({
  --   filetypes = { "sh", "bash", "zsh" },
  -- })
}

null_ls.setup({
  debug = false,
  sources = sources,
  -- root_dir = nls_utils.root_pattern(".git"),
})
