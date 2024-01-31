local status_ok, project_nvim = pcall(require, "project_nvim")
if not status_ok then
  print("project_nvim not working")
end

project_nvim.setup({
  silent_chdir = true, -- get a message when `project.nvim` change dir
  show_hidden = true, -- show hidden files
  ignore_lsp = { "null-ls" }, -- `null-ls` interferes with `project_nvim` to change dir
})
