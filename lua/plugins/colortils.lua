local status_ok, colortils = pcall(require, "colortils")
if not status_ok then
  print("colortils failing")
end

colortils.setup({})
