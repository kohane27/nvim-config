local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  print("mason_lspconfig not working")
end

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    -- "angularls",
    "cssls",
    "cssmodules_ls",
    "dockerls",
    "eslint",
    "html",
    "lemminx",
    "pyright",
    "pylsp",
    "sqlls",
    "jsonls",
  },
  automatic_installation = false,
})
