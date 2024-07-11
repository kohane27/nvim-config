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
    -- remove annoying `notify`
    { "kohane27/telescope-frecency.nvim" },
  },
  config = function()
    local actions = require("telescope.actions")
    local telescope = require("telescope")

    require("telescope").setup({
      defaults = {
        layout_config = {
          horizontal = {
            width = 0.9,
            preview_width = 0.6,
            preview_cutoff = 0,
          },
        },
        prompt_prefix = "   ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { "node_modules", "package-lock.json", "yarn.lock" },

        -- NOTE: configure in `utils.lua`
        -- find_command = { "rg", "--hidden", "--ignore-case" },

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

            ["<C-f>"] = actions.preview_scrolling_down,
            ["<C-b>"] = actions.preview_scrolling_up,

            ["<Tab>"] = false,
            ["<S-Tab>"] = false,

            ["v"] = actions.toggle_selection + actions.move_selection_worse,
            ["<C-c>"] = actions.send_selected_to_qflist + actions.open_qflist,
            -- ["V"] = actions.toggle_selection + actions.move_selection_better,
            ["V"] = actions.send_to_qflist + actions.open_qflist,

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
          db_safe_mode = false,
          ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
        },
        zoxide = {
          mappings = {
            default = {
              after_action = function(selection)
                vim.cmd("tabnew")
                require("telescope.builtin").find_files({ cwd = selection.path })
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
          mappings = {
            n = {
              -- inside a function to prevent lazy-loading error
              ["y"] = function(bufnr)
                return require("telescope-undo.actions").yank_larger(bufnr)
              end,
              ["Y"] = require("telescope-undo.actions").yank_deletions,
              ["u"] = require("telescope-undo.actions").restore,
            },
          },
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
