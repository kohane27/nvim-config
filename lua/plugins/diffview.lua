local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  print("diffview not working")
end

diffview.setup({
  -- leave it empty to use the default settings
})
