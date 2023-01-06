local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
  print("spectre not working")
end

spectre.setup({})
