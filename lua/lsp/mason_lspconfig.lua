local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  print("mason_lspconfig not working")
end

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "angularls",
    "tsserver",
    "awk_ls",
    "bashls",
    "cssls",
    "cssmodules_ls",
    "dockerls",
    "emmet_ls",
    "eslint",
    -- "graphql",
    "html",
    "lemminx",
    "pyright",
    "pylsp",
    "sqls",
    "jsonls",
  },
  automatic_installation = false,
})
