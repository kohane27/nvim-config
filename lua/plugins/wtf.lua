local status_ok, wtf = pcall(require, "wtf")
if not status_ok then
  print("wtf not working")
end

wtf.setup({
  popup_type = "vertical",
  openai_model_id = "gpt-4-1106-preview",
  -- Send code as well as diagnostics
  context = true,
  -- Any additional instructions
  additional_instructions = "Start the reply with 'OH HAI THERE'",
  -- Callbacks
  winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
})
