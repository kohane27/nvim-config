local lsp_status_ok, lspformat = pcall(require, 'lsp-format')
if not lsp_status_ok then
  print("lsp_format failing")
end

-- BUG: saving removes my changes
-- on save reverted changes if LSP is not yet attached

lspformat.setup {
  sync = true,
  -- markdown = {
  --   exclude = { "null-ls" }
  -- },
  -- lua = {
  --   sync = true,
  -- },
  -- c = {
  --   exclude = { "null-ls" }
  -- }
}

-- below code is in lsp_config.lua
-- local on_attach = function(client)
--     require "lsp-format".on_attach(client)


-- vim.cmd([[
-- " format on save except the following
-- let ftToIgnore = ['c', 'markdown']
-- autocmd BufWritePre * if index(ftToIgnore, &ft) < 0 | lua vim.lsp.buf.formatting_sync()
-- ]])
