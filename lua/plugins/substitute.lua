local status_ok, substitute = pcall(require, "substitute")
if not status_ok then
  print("substitute not working")
end

substitute.setup({
  exchange = {
    motion = false,
    use_esc_to_cancel = true,
  },
})
