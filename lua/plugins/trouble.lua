local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  print("trouble not working")
end

trouble.setup({})
