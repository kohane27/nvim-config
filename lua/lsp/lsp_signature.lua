local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  print("lsp_signature failing")
end

lsp_signature.setup({
  bind = true, -- mandatory
  hint_enable = true,
  hint_prefix = "💡 ",
  handler_opts = {
    border = "rounded", -- double, rounded, single, shadow, none
  },

  padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
})
