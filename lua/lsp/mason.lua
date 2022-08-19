local status_ok, mason = pcall(require, "mason")
if not status_ok then
  print("mason failing")
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
    },
  },
})
