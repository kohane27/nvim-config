local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print("telescope not working")
end

local actions = require("telescope.actions")

-- use `vim.find_files_from_project_git_root` and nvim will become unbearably slow
local function find_files_from_project_git_root(selection)
  if vim.fn.getcwd() == os.getenv("HOME") then
    return print("Current directory is home. Exiting")
  end
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  else
    opts = {
      cwd = selection.path,
    }
  end
  require("telescope.builtin").find_files(opts)
end

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
      "npm-shrinkwrap.json",
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
        -- ["<C-c>"] = actions.close,
        -- ["<esc>"] = actions.close,
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,

        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,

        ["<C-d>"] = false,
        ["<C-u>"] = false, -- using default to clear prompt
        ["<C-w>"] = { "<C-S-w>", type = "command" }, -- using default to delete word
      },

      n = {
        ["?"] = false,
        ["q"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,

        ["gg"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["G"] = actions.move_to_bottom,

        ["<C-b>"] = actions.preview_scrolling_up,
        ["<C-f>"] = actions.preview_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<leader>x"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["<C-u>"] = actions.move_selection_previous
          + actions.move_selection_previous
          + actions.move_selection_previous
          + actions.move_selection_previous
          + actions.move_selection_previous,

        ["<C-d>"] = actions.move_selection_next
          + actions.move_selection_next
          + actions.move_selection_next
          + actions.move_selection_next
          + actions.move_selection_next,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case", -- or "smart_case", "ignore_case", "respect_case"
    },
    frecency = {
      show_scores = false,
      show_unindexed = false,
      auto_validate = true,
      db_validate_threshold = 999,
      db_safe_mode = false,
      ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
    },
    zoxide = {
      mappings = {
        default = {
          after_action = function(selection)
            -- delete all buffers
            -- for _, e in ipairs(require("bufferline").get_elements().elements) do
            --   vim.cmd("bd " .. e.id)
            -- end
            -- vim.cmd("Rooter")
            vim.cmd("tabnew")
            find_files_from_project_git_root(selection.path)
          end,
        },
      },
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("frecency")
telescope.load_extension("neoclip")
telescope.load_extension("zoxide")
telescope.load_extension("scope")
