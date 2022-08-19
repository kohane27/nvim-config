local status_ok, goto_preview = pcall(require, "goto-preview")
if not status_ok then
  print("goto-preview failing")
end

goto_preview.setup({})
