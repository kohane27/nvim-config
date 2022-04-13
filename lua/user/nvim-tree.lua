-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	print("config_status_ok NO")
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	update_cwd = true,
	open_file = {
		quit_on_open = true,
		resize_window = true,
	},

	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},

	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	view = {
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
	},
})

-- nvim_tree.setup({
-- 	update_to_buf_dir = {
-- 		enable = true,
-- 		auto_open = true,
-- 	},
-- 	git_hl = 1,
-- 	disable_window_picker = 0,
-- 	root_folder_modifier = ":t",
-- 	show_icons = {
-- 		git = 1,
-- 		folders = 1,
-- 		files = 1,
-- 		folder_arrows = 1,
-- 		tree_width = 30,
-- 	},
-- })
