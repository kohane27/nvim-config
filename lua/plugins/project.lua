local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
  return
end

project.setup({
  -- false and you'll get a message when project.nvim changes your directory
  silent_chdir = true,
})
