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
	print("nvim-tree.config config_status_ok NO")
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	update_cwd = true,
	actions = {
		change_dir = {
			enable = true,
			global = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = true,
		},
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
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {
				-- action = "" means removing default
				{ key = "v", action = "vsplit" },
				{ key = "h", action = "split" },
				{ key = "t", action = "tabnew" },

				{ key = "R", action = "refresh" },
				{ key = "a", action = "create" },
				{ key = "d", action = "remove" },
				{ key = "D", action = "trash" },
				{ key = "r", action = "rename" },
				{ key = { "<CR>", "o", "L" }, action = "edit" },
				{ key = { "<C-]>" }, action = "cd" },
				{ key = "P", action = "parent_node" },
				{ key = "H", action = "close_node" },
				{ key = "<Tab>", action = "preview" },

				{ key = "K", action = "first_sibling" },
				{ key = "J", action = "last_sibling" },
				{ key = "<C-r>", action = "full_rename" },

				{ key = "x", action = "cut" },
				{ key = "c", action = "copy" },
				{ key = "p", action = "paste" },
				{ key = "y", action = "copy_name" },
				{ key = "Y", action = "copy_path" },
				{ key = "gy", action = "copy_absolute_path" },

				{ key = "q", action = "close" },
				{ key = "g?", action = "toggle_help" },
				{ key = "W", action = "collapse_all" },
				{ key = ".", action = "run_file_command" },
				{ key = "O", action = "" },
				{ key = "-", action = "" },
				{ key = "I", action = "" },
				{ key = "S", action = "" }, -- conflict with lightspeed
				{ key = "[c", action = "" },
				{ key = "]c", action = "" },
				{ key = "s", action = "" },
				{ key = "<C-k>", action = "" },
				{ key = "<C-e>", action = "" },
				{ key = "<", action = "" },
				{ key = ">", action = "" },
			},
		},
	},
})

-- old config
-- nvim_tree.setup({
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
