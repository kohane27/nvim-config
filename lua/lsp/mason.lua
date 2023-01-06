local status_ok, mason = pcall(require, "mason")
if not status_ok then
  print("mason not working")
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
    },
  },
})
