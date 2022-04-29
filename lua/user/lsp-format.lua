local status_ok, lsp_format = pcall(require, "lsp-format")
if not status_ok then
    print("lsp-format failing")
end

lsp_format.setup({})

local on_attach = function(client)
    lsp_format.on_attach(client)

    -- ... custom code ...
end
require("lspconfig").gopls.setup({ on_attach = on_attach })
