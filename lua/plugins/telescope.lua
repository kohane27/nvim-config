return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  dependencies = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "romgrk/fzy-lua-native" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ Telescope extensions                                    │
    -- ╰─────────────────────────────────────────────────────────╯
    -- undo tree
    { "debugloop/telescope-undo.nvim" },
    -- better `live_grep`
    { "fdschmidt93/telescope-egrepify.nvim" },
    { "jvgrootveld/telescope-zoxide" },
    {
      "nvim-telescope/telescope-frecency.nvim",
      -- TODO: error: sql statement parse, , stmt: `sel
      commit = "0a4a521471141ae3c94ff0ebcffcaff3c3aad147",
      dependencies = { "kkharji/sqlite.lua" },
    },
  },
  config = function()
    local actions = require("telescope.actions")
    local telescope = require("telescope")

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
    require("telescope").setup({
      defaults = {
        layout_config = {
          vertical = { width = 0.9 },
          horizontal = {
            width = 0.9,
            preview_cutoff = 0,
          },
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
            ["<C-q>"] = actions.close,
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

            ["v"] = actions.toggle_selection + actions.move_selection_worse,
            -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-A-c>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-c>"] = actions.send_selected_to_qflist + actions.open_qflist,

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
        egrepify = {
          AND = true,
          permutations = true, -- imply AND & match all permutations of prompt tokens
        },
        undo = {
          use_delta = true,
          side_by_side = true,
          layout_config = {
            preview_width = 0.8,
            horizontal = {
              height = 0.95,
              width = 0.95,
            },
            vertical = {
              height = 0.95,
              width = 0.95,
            },
          },
        },
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("frecency")
    telescope.load_extension("zoxide")
    telescope.load_extension("scope")
    telescope.load_extension("egrepify")
    telescope.load_extension("undo")
    vim.api.nvim_set_hl(0, "TelescopePathSeparator", {})
  end,
}
