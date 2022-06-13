local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  return
end

diffview.setup({
  -- leave it empty to use the default settings
})
