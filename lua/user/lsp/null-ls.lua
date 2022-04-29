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

local with_diagnostics_code = function(builtin)
	return builtin.with({
		diagnostics_format = "#{m} [#{c}]",
	})
end

local with_root_file = function(builtin, file)
	return builtin.with({
		condition = function(utils)
			return utils.root_has_file(file)
		end,
	})
end

local sources = {

	-- formatting
	formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
	formatting.black.with({ extra_args = { "--fast" } }),
	formatting.stylua,
	builtins.formatting.shfmt,
	builtins.formatting.isort,
	with_root_file(builtins.formatting.stylua, "stylua.toml"),

	-- diagnostics
	-- builtins.diagnostics.write_good,
	-- builtins.diagnostics.markdownlint,
	-- builtins.diagnostics.eslint_d,
	builtins.diagnostics.flake8,
	builtins.diagnostics.tsc,
	with_diagnostics_code(builtins.diagnostics.shellcheck),
    -- with_root_file(builtins.diagnostics.selene, "selene.toml"),

	-- code actions
	builtins.code_actions.gitsigns,
	builtins.code_actions.gitrebase,
}

null_ls.setup({
	debug = false,
	sources = sources,
	root_dir = nls_utils.root_pattern(".git"),
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
