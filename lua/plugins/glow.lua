local status_ok, glow = pcall(require, "glow")
if not status_ok then
  print("glow not working")
end

glow.setup({})
