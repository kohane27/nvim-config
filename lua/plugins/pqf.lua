local status_ok, pqf = pcall(require, "pqf")
if not status_ok then
  print("pqf not working")
end

pqf.setup({
  signs = {
    error = "E",
    warning = "W",
    info = "I",
    hint = "H",
  },
})
