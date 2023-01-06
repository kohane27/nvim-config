local status_ok, live_command = pcall(require, "live-command")
if not status_ok then
  print("live-command not working")
end

local commands = {
  Norm = {
    cmd = "norm",
  },
  -- `:5Reg a` to preview macro of `a` 5 times
  Reg = {
    cmd = "norm",
    args = function(opts)
      return (opts.count == -1 and "" or opts.count) .. "@" .. opts.args
    end,
    range = "",
  },
  G = {
    cmd = "g",
    hl_range = { 1, -1, kind = "absolute" },
  },
}

live_command.setup({
  commands = commands,
})
