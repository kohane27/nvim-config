local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  print("mason_lspconfig failing")
end

mason_lspconfig.setup({
  ensure_installed = {
    "sumneko_lua",
    "rust_analyzer",
    "tsserver",
    "awk_ls",
    "bashls",
    "cssls",
    "cssmodules_ls",
    "dockerls",
    "emmet_ls",
    "eslint",
    "graphql",
    "html",
    "lemminx",
    "pyright",
    "sqls",
    "jsonls",
  },
  automatic_installation = true,
})
