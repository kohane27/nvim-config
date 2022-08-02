local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
  print("spectre failing")
end

spectre.setup({})
