local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  print("diffview not working")
end

diffview.setup({})
