local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end

project.setup({
  -- When set to false, you will get a message when project.nvim changes your
  -- directory.
  silent_chdir = true,
})

-- lua tree integration
vim.g.nvim_tree_respect_buf_cwd = 1
require("nvim-tree").setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
})

-- telescope integration
local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end

telescope.load_extension('projects')
