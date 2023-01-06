local status_ok, colortils = pcall(require, "colortils")
if not status_ok then
  print("colortils not working")
end

colortils.setup({})
