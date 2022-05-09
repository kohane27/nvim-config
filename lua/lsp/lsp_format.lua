local lsp_status_ok, lspformat = pcall(require, 'lsp-format')
if not lsp_status_ok then
  print("lsp_format failing")
end

lspformat.setup {
  sync = true,
  markdown = {
    exclude = { "null-ls" }
  },
  c = {
    exclude = { "null-ls" }
  }
}

-- below code is in lsp_config.lua
-- local on_attach = function(client)
--     require "lsp-format".on_attach(client)
