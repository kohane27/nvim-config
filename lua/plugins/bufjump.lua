local status_ok, bufjump = pcall(require, "bufjump")
if not status_ok then
  return
end

bufjump.setup({
  forward = "<A-i>",
  backward = "<A-o>",
  on_success = nil,
})
