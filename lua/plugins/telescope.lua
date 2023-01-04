local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print("telescope not working")
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
      -- "package.json",
      "package-lock.json",
      "yarn.lock",
      -- Obsidian dir below
      "SecondBrain/.obsidian",
      "SecondBrain/.trash",
      "SecondBrain/Courses",
      "SecondBrain/Journal",
      "CoursesPending",
      "home",
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

        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-c>"] = actions.close,
        ["<C-w>s"] = actions.select_horizontal,
        ["<C-w>v"] = actions.select_vertical,
        ["<C-w>t"] = actions.select_tab,

        ["<C-d>"] = actions.results_scrolling_down,
        ["<C-u>"] = actions.results_scrolling_up,

        -- only in Normal mode
        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        -- ["<C-u>"] = actions.preview_scrolling_up,
        -- ["<C-d>"] = actions.preview_scrolling_down,

        -- ["<C-l>"] = actions.complete_tag,
        -- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<C-c>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-w>s"] = actions.select_horizontal,
        ["<C-w>v"] = actions.select_vertical,
        ["<C-w>t"] = actions.select_tab,

        ["j"] = actions.move_selection_next,
        -- TODO
        -- ["J"] = ":5j",
        ["k"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["G"] = actions.move_to_bottom,

        ["<C-d>"] = actions.results_scrolling_down,
        ["<C-u>"] = actions.results_scrolling_up,

        -- ["<C-u>"] = actions.preview_scrolling_up,
        -- ["<C-d>"] = actions.preview_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,

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
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "ignore_case", -- or "smart_case", "ignore_case" or "respect_case"
    },
    -- frecency = {
    --   show_scores = false,
    --   show_unindexed = false,
    --   auto_validate = true,
    --   ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
    --   disable_devicons = false,
    --   workspaces = {
    --     ["conf"] = "~/.config",
    --     ["data"] = "~/.local/share",
    --     ["project"] = "~/Documents",
    --   },
    -- },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("projects")
-- telescope.load_extension("frecency") -- TODO very annoying msg
telescope.load_extension("neoclip")
telescope.load_extension("olddirs")
