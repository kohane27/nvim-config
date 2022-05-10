-- BUG: saving removes my changes
-- on save reverted changes if LSP is not yet attached

local lsp_status_ok, lspformat = pcall(require, 'lsp-format')
if not lsp_status_ok then
  print("lsp_format failing")
end

lspformat.setup {
  markdown = {
    exclude = { "null-ls" }
  },
  lua = {
    sync = true,
  },
  c = {
    exclude = { "null-ls" }
  }
}

-- below code is in lsp_config.lua
-- local on_attach = function(client)
--     require "lsp-format".on_attach(client)
