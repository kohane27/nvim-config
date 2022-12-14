-- Setup nvim-cmp
local status_ok, stabilize = pcall(require, "stabilize")
if not status_ok then
  print("stabilize not working")
end

stabilize.setup()
