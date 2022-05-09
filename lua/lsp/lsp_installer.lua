local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
   return
end

-- Deprecation of lsp_installer.on_server_ready()
-- https://github.com/williamboman/nvim-lsp-installer/discussions/636
lsp_installer.setup({
   -- ensure_installed is not needed as automatic_installation is enabled
   -- any lsp server you setup by lspconfig is going to get installed automatically

   -- ensure_installed = { "lua" },
   automatic_installation = true,

   ui = {
      icons = {
         server_installed = "",
         server_pending = "",
         server_uninstalled = "ﮊ",
      },
   },

   max_concurrent_installers = 20,
})
