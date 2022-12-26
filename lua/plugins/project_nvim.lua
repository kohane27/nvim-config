local status_ok, project_nvim = pcall(require, "project_nvim")
if not status_ok then
  print("project_nvim not working")
end

project_nvim.setup({
  -- get a message when project.nvim changes your directory
  silent_chdir = true,
  -- show hidden files
  show_hidden = true,
})
