local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  print("nightfox failing")
end

nightfox.setup({})
