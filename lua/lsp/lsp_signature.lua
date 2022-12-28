local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  print("lsp_signature failing")
end

lsp_signature.setup({
  bind = true, -- mandatory
  hint_enable = true,
  hint_prefix = "🐼 ",
  handler_opts = {
    border = "rounded", -- double, rounded, single, shadow, none
  },
  padding = " ", -- character to pad on left and right of signature can be ' ', or '|'  etc
  toggle_key = "<M-x>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
  select_signature_key = "<M-n>", -- cycle to next signature, e.g. '<M-n>' function overloading
})
