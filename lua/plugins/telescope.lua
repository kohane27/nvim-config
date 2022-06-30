local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.9 },
      horizontal = {
        width = 0.9,
        preview_cutoff = 0,
      },
    },
    file_ignore_patterns = {
      ".mp4",
      ".webm",
      ".mkv",
      ".avi",
      ".m4a",
      ".mp3",
      ".dll",
      ".db",
      ".exe",
      ".ogg",
      ".png",
      ".jpg",
      ".jpeg",
      ".pdf",
      ".7z",
      ".rar",
      ".tar",
      ".zip",
      ".doc",
      ".docx",
      ".gif",
      ".class",
      "node_modules",
      ".cache",
      ".icons",
      ".undodir",
      ".PlayOnLinux",
      "Calibre Library",
      "Games",
      "PlayOnLinux's virtual drives",
      "snap",
      "Videos",
    },
    -- Hidden files and directories can be searched with --hidden
    find_command = { "rg", "--hidden", "--ignore-case" },
    prompt_prefix = "   ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,

        ["<C-p>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.move_selection_next,

        ["<CR>"] = actions.select_default,
        ["<C-c>"] = actions.close,
        ["<C-w>s"] = actions.select_horizontal,
        ["<C-w>v"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        -- ["<PageUp>"] = actions.results_scrolling_up,
        -- ["<PageDown>"] = actions.results_scrolling_down,

        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ["<C-l>"] = actions.complete_tag,
        -- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<C-c>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        -- ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    frecency = {
      show_scores = false,
      show_unindexed = false,
      auto_validate = true,
      ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
      disable_devicons = false,
      workspaces = {
        ["conf"] = "/home/hin/.config",
        ["data"] = "/home/hin/.local/share",
        ["project"] = "~/Documents",
      },
    },
  },
})

telescope.load_extension("fzf")
-- telescope.load_extension("file_browser")
telescope.load_extension("projects")
telescope.load_extension("frecency")
