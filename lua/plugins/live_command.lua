local status_ok, live_command = pcall(require, "live-command")
if not status_ok then
  print("live-command failing")
end

live_command.setup({
  commands = {
    Norm = { cmd = "norm" },
  },
})
