local status_ok, substitute = pcall(require, "substitute")
if not status_ok then
  print("substitute not working")
end

substitute.setup({
  {
    on_substitute = nil,
    yank_substitued_text = false,
    range = {
      prefix = "",
    },
    exchange = {
      motion = false,
    },
  },
})
