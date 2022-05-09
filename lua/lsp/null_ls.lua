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

    -- formatting
    formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
    formatting.black.with({ extra_args = { "--fast" } }),
    -- formatting.stylua,
    builtins.formatting.shfmt,
    builtins.formatting.isort,

    -- diagnostics
    -- builtins.diagnostics.write_good,
    -- builtins.diagnostics.markdownlint,
    builtins.diagnostics.eslint_d,
    -- builtins.diagnostics.flake8,
    -- builtins.diagnostics.tsc,
    builtins.diagnostics.shellcheck,

    -- code actions
    builtins.code_actions.gitsigns,
    builtins.code_actions.gitrebase,
}

null_ls.setup({
    debug = false,
    sources = sources,
    root_dir = nls_utils.root_pattern(".git"),
})
