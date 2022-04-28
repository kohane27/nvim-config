local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local nls = require "null-ls"
local nls_utils = require "null-ls.utils"
local b = nls.builtins

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local with_diagnostics_code = function(builtin)
	return builtin.with({
		diagnostics_format = "#{m} [#{c}]",
	})
end

local sources = {
	formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
	formatting.black.with({ extra_args = { "--fast" } }),
	formatting.stylua,
	null_ls.builtins.code_actions.shellcheck,
	with_diagnostics_code(b.diagnostics.shellcheck),
}

null_ls.setup({
	debug = true,
	sources = sources,
	-- format on save
	on_attach = function(client)
		-- if client.resolved_capabilities.document_formatting then
		--     vim.cmd([[
		--     augroup LspFormatting
		--         autocmd! * <buffer>
		--         autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
		--     augroup END
		--     ]])
		-- end
	end,
})
