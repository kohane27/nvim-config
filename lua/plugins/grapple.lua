local status_ok, grapple = pcall(require, "grapple")
if not status_ok then
  print("grapple failing")
end

grapple.setup({
  integrations = {
    ---Support for saving tag state using resession.nvim
    resession = false,
  },
})
