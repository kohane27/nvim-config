local status_ok, notify = pcall(require, "notify")
if not status_ok then
  print("notify not working")
end

vim.notify = notify
