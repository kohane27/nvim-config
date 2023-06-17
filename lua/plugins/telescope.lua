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
      ".webp",
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
      ".git",
      ".cache",
      -- "package.json",
      "package-lock.json",
      "yarn.lock",
      ".obsidian",
    },
    -- Hidden files and directories can be searched with --hidden
    find_command = { "rg", "--hidden", "--ignore-case" },
    prompt_prefix = "   ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,

        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-c>"] = actions.close,

        ["<C-d>"] = false,
        ["<C-u>"] = false, -- clear prompt

        -- ["<C-l>"] = actions.complete_tag,
      },

      n = {
        ["<C-c>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-w>s"] = actions.select_horizontal,
        ["<C-w>v"] = actions.select_vertical,
        ["<C-w>t"] = actions.select_tab,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,

        ["gg"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["G"] = actions.move_to_bottom,

      ["<C-b>"] = actions.preview_scrolling_up,
      ["<C-f>"] = actions.preview_scrolling_down,

        ["<C-u>"] = actions.move_selection_previous
          + actions.move_selection_previous
          + actions.move_selection_previous
          + actions.move_selection_previous
          + actions.move_selection_previous
          + actions.move_selection_previous
          + actions.move_selection_previous
          + actions.move_selection_previous
          + actions.move_selection_previous
          + actions.move_selection_previous,

        ["<C-d>"] = actions.move_selection_next
          + actions.move_selection_next
          + actions.move_selection_next
          + actions.move_selection_next
          + actions.move_selection_next
          + actions.move_selection_next
          + actions.move_selection_next
          + actions.move_selection_next
          + actions.move_selection_next
          + actions.move_selection_next,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["?"] = actions.which_key,
      },
    },
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
    --   disable_devicons = false,
    --   ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
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
-- telescope.load_extension("frecency")
telescope.load_extension("neoclip")
telescope.load_extension("olddirs")
