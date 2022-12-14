local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  print("trouble failing")
end

trouble.setup({})
