return {
  "mrjones2014/legendary.nvim",
  -- NOTE: has to be `VeryLazy` for commands to be registered first
  event = "VeryLazy",
  dependencies = { "kkharji/sqlite.lua", "stevearc/dressing.nvim" },
  opts = {
    include_builtin = false,
    include_legendary_cmds = false,
    -- NOTE: this takes precedence over other sort options
    sort = { frecency = { db_root = string.format("%s/legendary/", vim.fn.stdpath("data")), max_timestamps = 20 } },
    -- `keys` spec will be automatically loaded
    extensions = { lazy_nvim = true, diffview = true },
      -- stylua: ignore
      keymaps = {
        -- NOTE: use <cmd> for normal Ex commands because it's faster for some reason
        --       use : if you need to have visual mode

        -- NOTE: the following are available:
        -- J!!, K!!, T
        -- gh, gn
        -- gb, go, gs, gw, gy, gz, gq
        -- <leader> h, i, k, p, u, v, w, y, z

        -- start with g
        { "gt", "<cmd>write | edit | TSBufEnable highlight<CR>",                                 description = "Treesitter: Reload" },
        { "ga", function() require("core.utils").get_current_buffer_content() end,               description = "Get Current Buffer Content" },
        { "gA", function() require("core.utils").get_all_buffer_content() end,                   description = "Get All Buffer Content" },
        { "gu", "<cmd>UndotreeToggle<CR>",                                                       description = "Undotree: Toggle" },
        { "gU", "<cmd>Telescope undo<CR>",                                                       description = "Telescope: Undo" },

        -- <leader>g

        { "F", "<cmd>Oil --float<CR>",                                                           description = "Oil" },
        { "X", "<cmd>ISwapWith<CR>",                                                             description = "Swap Two Adjacent Nodes" },
        { "R", function() require("flash").treesitter() end,                                     description = "Flash Treesitter", mode = { "n", "x", "o" } },

        -- <C-KEY>
        { "<C-e>", function() require("yazi").yazi() end,                                        description = "Yazi" },
        { "<C-q>", "<cmd>LazyGit<CR>",                                                           description = "Lazygit" },
        { "<C-t>", "<cmd>ToggleTerm<CR>",                                                        description = "Toggle terminal" },
        { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end,         description = "Increment" },
        { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end,         description = "Decrement" },
        { "<C-f>", function() require("nvim-tree.api").tree.toggle({ find_file = true }) end,    description = "Tree: Toggle With Focused File" },
        { "<C-g>", function() require("core.utils").find_files_from_project_git_root() end,      description = "Telescope: Find Files" },
        -- { "<C-p>", "<cmd>Legendary<CR>",                                                      description = "Legendary Command Palette", mode = { "n", "x" } },
        { "<C-p>", function() require("core.utils").legendary_command_palette() end,             description = "Legendary Command Palette", mode = { "n", "x" } },

        { "<C-v>", { i = '<C-R>+' },                                                             description = "Paste Clipboard Content" },
        { "<C-f>", { i = '<C-R>0' },                                                             description = "Paste Last Yanked" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Telescope                                                │
        -- ╰──────────────────────────────────────────────────────────╯
        {
          "<leader>fg",
          function() require("core.utils").live_grep_from_project_git_root() end,
          description = "Telescope: Find Text",
          mode = { "n", "x" },
        },
        {
          "<leader>ft",
          function() require("telescope.builtin").live_grep({ grep_open_files = true }) end,
          description = "Telescope: Find Text in Opened Tabs",
        },
        {
          "<leader>fb",
          {
            n = function() require("telescope.builtin").current_buffer_fuzzy_find() end,
            v = function() require("telescope.builtin").current_buffer_fuzzy_find({ default_text = require("core.utils").get_visual_selection() }) end,
          },
          description = "Telescope: Find Text in Current Buffer",
        },
        {
          "<leader>fs",
          function() require('spectre').open({ search_text="\\w+ello\\b", replace_text="world", path="**"  }) end,
          description = "Spectre: Search in Files"
        },

        -- not frequent below
        { "<leader>ff", function() require("telescope.builtin").find_files() end,         description = "Telescope: Find Files in Current Directory" },
        { "<leader>fr", function() require("telescope.builtin").resume() end,             description = "Telescope: Resume" },
        { "<leader>fp", "<cmd>Telescope neoclip<CR>",                                     description = "Telescope: Clipboard" },
        { "<leader>fB", "<cmd>Telescope scope buffers<CR>",                               description = "Telescope: Tabs" },
        { "<leader>fd", "<cmd>Telescope frecency workspace=CWD<CR>",                      description = "Telescope: Find Frecency" },
        { "<leader>fz", function() require("telescope").extensions.zoxide.list() end,     description = "Telescope: Zoxide" },
        { "<leader>fj", function() require("telescope.builtin").jumplist() end,           description = "Telescope: Jumplist" },
        { "<leader>fXc", function() require("telescope.builtin").command_history() end,   description = "Telescope: Command History" },
        { "<leader>fXs", function() require("telescope.builtin").search_history() end,    description = "Telescope: Search History" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ LSP                                                      │
        -- ╰──────────────────────────────────────────────────────────╯
        { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>",                                  description = "LSP: Line Diagnostics" },
        -- it'll show with code action but doesn't show current cursor diagnostic
        { "gL", "<cmd>Lspsaga diagnostic_jump_next<CR>",                                   description = "LSP: Line Diagnostics" },
        { "<leader>ld", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>",     description = "Trouble: Buffer Diagnostics" },
        { "<leader>lD", "<cmd>Trouble diagnostics toggle focus=true<CR>",                  description = "Trouble: Project Diagnostics" },

        { "gh", "<cmd>Lspsaga hover_doc ++quiet<CR>",                                      description = "LSP: Hover Doc (quiet)" },
        { "gH", "<cmd>Lspsaga hover_doc ++keep<CR>",                                       description = "LSP: Hover Doc (keep)" },

        { "gd", "<cmd>Lspsaga goto_definition<CR>",                                        description = "LSP: Go to Definition" },
        { "gD", "<cmd>Lspsaga peek_definition<CR>",                                        description = "LSP: Preview Definition" },

        { "gr", "<cmd>lua vim.lsp.buf.references()<CR>",                                   description = "LSP: Reference List" },
        { "gR", "<cmd>Trouble lsp_references toggle<CR>",                                  description = "Trouble: Reference List" },

        -- order of importance
        { "<leader>lc", "<cmd>Lspsaga code_action<CR>",                                    description = "LSP: Code Action" },
        { "<leader>lf", "<cmd>Lspsaga finder<CR>",                                         description = "LSP: Symbol, Definition and Implementation" },
        { "<leader>ls", "<cmd>Trouble symbols toggle pinned=true<CR>",                     description = "Trouble: Symbols Outline" },
        { "<leader>lr", "<cmd>Lspsaga lsp_rename ++project<CR>",                           description = "LSP: Rename" },
        { "<leader>lp", "<cmd>TSToolsRenameFile<CR>",                                      description = "LSP: Rename (Current File)", filters = { ft = "javascriptreact", "typescriptreact" } },

        { "<leader>lXc", "<cmd>lua vim.lsp.codelens.run()<CR>",                            description = "LSP: Code Lens" },
        { "<leader>lXd", "<cmd>lua vim.lsp.buf.declaration<CR>",                           description = "LSP: Declaration" },
        { "<leader>lXf", "<cmd>lua vim.lsp.buf.format()<CR>",                              description = "LSP: Formatting" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Trouble.nvim                                             │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<leader>xx", "<cmd>Trouble todo<CR>",                    description = "Trouble: Toggle" },
        { "<leader>xt", "<cmd>TodoTelescope keywords=TODO<CR>",     description = "Trouble: Only TODO" },
        { "<leader>xT", "<cmd>TodoTelescope<CR>",                   description = "Trouble: All TODO" },

        -- ╭─────────────────────────────────────────────────────────╮
        -- │ quickfix                                                │
        -- ╰─────────────────────────────────────────────────────────╯
        { "<leader>co", "<cmd>copen<CR>", description = "Quickfix List" },
        {
          "<leader>cd",
          function() vim.api.nvim_feedkeys(":cdo s/foo/bar/gc | update", "c", false) end,
          description = "cdo: Execute Command on Quickfix Entries",
          -- only filter away the entries in Legendary; still executable in other ft
          filters = { ft = "qf", "Trouble" },
        },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ bufferline                                               │
        -- ╰──────────────────────────────────────────────────────────╯
        { "H", "<cmd>BufferLineCyclePrev<CR>",                                 description = "Buffer: Move to Previous" },
        { "L", "<cmd>BufferLineCycleNext<CR>",                                 description = "Buffer: Move to Next" },

        { "<A-,>", "<cmd>BufferLineMovePrev<CR>",                              description = "Buffer: Re-order to Previous" },
        { "<A-.>", "<cmd>BufferLineMoveNext<CR>",                              description = "Buffer: Re-order to Next" },

        { "<C-y>", "<cmd>BufferLineTogglePin<CR>",                             description = "Buffer: pin" },
        { "<C-h>", function() require("bufferline").go_to(1, true) end,        description = "Buffer: Go to 1" },
        { "<C-j>", function() require("bufferline").go_to(2, true) end,        description = "Buffer: Go to 2" },
        { "<C-k>", function() require("bufferline").go_to(3, true) end,        description = "Buffer: Go to 3" },
        { "<C-l>", function() require("bufferline").go_to(4, true) end,        description = "Buffer: Go to 4" },

        { "<leader>bl", "<cmd>BufferLineCloseRight<CR>",                       description = "Buffer: Close All Buffers to the Right" },
        { "<leader>bh", "<cmd>BufferLineCloseLeft<CR>",                        description = "Buffer: Close All Buffers to the Left" },
        { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>",                      description = "Buffer: Close All Other Visible Buffers" },
        { "<leader>bp", "<cmd>BufferLinePick<CR>",                             description = "Buffer: Choose a Buffer" },
        { "<leader>bc", "<cmd>BufferLinePickClose<CR>",                        description = "Buffer: Choose a Closing Buffer" },

        { "g1", function() require("bufferline").go_to(1)  end,                description = "Buffer: Go to 1" },
        { "g2", function() require("bufferline").go_to(2)  end,                description = "Buffer: Go to 2" },
        { "g3", function() require("bufferline").go_to(3)  end,                description = "Buffer: Go to 3" },
        { "g4", function() require("bufferline").go_to(4)  end,                description = "Buffer: Go to 4" },
        { "g5", function() require("bufferline").go_to(5)  end,                description = "Buffer: Go to 5" },
        { "g6", function() require("bufferline").go_to(6)  end,                description = "Buffer: Go to 6" },
        { "g7", function() require("bufferline").go_to(7)  end,                description = "Buffer: Go to 7" },
        { "g8", function() require("bufferline").go_to(8)  end,                description = "Buffer: Go to 8" },
        { "g9", function() require("bufferline").go_to(9)  end,                description = "Buffer: Go to 9" },
        { "g0", function() require("bufferline").go_to(-1) end,                description = "Buffer: Go to 10" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Tab (for scope.nvim)                                     │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<leader>th", "<cmd>tabprev<CR>",  description = "Tab: Previous" },
        { "<leader>tl", "<cmd>tabnext<CR>",  description = "Tab: Next" },
        { "<leader>tn", "<cmd>tabnew<CR>",   description = "Tab: New" },
        { "<leader>tc", "<cmd>tabclose<CR>", description = "Tab: Close" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ tmux.lua                                                 │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<A-h>",   function() require("tmux").move_left() end,       description = "Move Focus to Left" },
        { "<A-l>",   function() require("tmux").move_right() end,      description = "Move Focus to Right" },
        { "<A-k>",   function() require("tmux").move_top() end,        description = "Move Focus to Top" },
        { "<A-j>",   function() require("tmux").move_bottom() end,     description = "Move Focus to Bottom" },
        { "<C-S-h>", function() require("tmux").resize_left() end,     description = "Resize Left" },
        { "<C-S-l>", function() require("tmux").resize_right() end,    description = "Resize Right" },
        { "<C-S-k>", function() require("tmux").resize_top() end,      description = "Resize Top" },
        { "<C-S-j>", function() require("tmux").resize_bottom() end,   description = "Resize Bottom" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Diffview.nvim                                            │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<leader>do", "<cmd>DiffviewOpen<CR>",        description = "Diffview: Open" },
        { "<leader>dh", "<cmd>DiffviewOpen HEAD^!<CR>", description = "Diffview: Current Commit and Prior Commit" },
        {
          '<leader>df',
          function()
            if require("legendary.toolbox").is_visual_mode() then
              -- it auto injects '<,'>
              vim.cmd(":DiffviewFileHistory")
            else
              vim.cmd(':DiffviewFileHistory %')
            end
          end,
          mode = { 'n', 'v' },
          description = 'Diffview: File or Range of Current File',
        },
        {
          "<leader>dHa",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":DiffviewOpen HEAD~3", true, true, true), "t", true) end,
          description = "Diffview: HEAD and n Prior Commits",
        },
        {
          "<leader>dHb",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":DiffviewOpen d4a7b0d", true, true, true), "t", true) end,
          description = "Diffview: Compares Changes Made by `d4a7b0d` with Current Working Directory",
        },
        {
          "<leader>dHc",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":DiffviewOpen d4a7b0d^!<Left><Left>", true, true, true), "t", true) end,
          description = "Diffview: Changes Made in the Single `d4a7b0d`",
        },
        {
          "<leader>dHd",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":DiffviewOpen c1..c2<Left><Left><Left><Left>", true, true, true), "t", true) end,
          description = "Diffview: Changes Between 2 Commits (from `d4a7b0d` up to `519b30e` (inclusive)).",
        },
        { "<leader>dHh", "<cmd>DiffviewFileHistory<CR>",                         description = "Diffview: File History of Current Branch" },
        { "<leader>dHi", "<cmd>Gitsigns toggle_current_line_blame<CR>",          description = "Diffview: Toggle Current Line Blame" },

        -- { "<leader>dg", "<cmd>Gitsigns preview_hunk<CR>", description = "Diffview: Preview Hunk" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Run Code                                                 │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<leader>rf", "<cmd>RunCode<CR>",   description = "Run File" },
        { "<leader>rs", "<cmd>SnipRun<CR>",   description = "Run Snip" },
        { "<leader>rc", "<cmd>SnipClose<CR>", description = "Close Snip" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ scratch.nvim                                             │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<leader>so", "<cmd>ScratchWithName<CR>" ,                                    description = "Scratch: New File" },
        { "<leader>ss", function() require("core.utils").toggle_scratchpad() end,       description = "Scratch: Toggle ScratchPad" },
        { "<leader>sf", "<cmd>ScratchOpenFzf<CR>",                                      description = "Scratch: Find File Contents" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ gp.nvim                                                  │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<leader>sf", function() require("core.utils").gp_choose_agent() end, description = "GPT: Choose an Agent" },
        { "<leader>ss", function() vim.api.nvim_exec("GpChatToggle vsplit", false) vim.api.nvim_win_set_width(0, 90) end, description = "GPT: Toggle" },
        { "<leader>sg", function() require("telescope").extensions.egrepify.egrepify({ cwd = os.getenv("HOME") .. "/.local/share/nvim/gp/chats" }) end, description = "GPT: Finder" },
        { "<leader>sa", "<cmd>GpAppend<CR>", description = "GPT: Append" },
        {
          "<leader>so",
          function()
            vim.api.nvim_exec("GpChatNew vsplit", false)
            vim.api.nvim_win_set_width(0, 90)
            vim.api.nvim_exec("GpAgent claude-3-5-sonnet-20240620-Ultimate-Assistant", false)
          end,
          description = "GPT: Ultimate Assistant",
        },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ AI                                                       │
        -- ╰──────────────────────────────────────────────────────────╯
        -- { "<leader>ao", "<cmd>CodeCompanionChat<CR>", description = "GPT: Open" },
        -- { "<leader>ai", ":'<,'>GpImplement<CR>", description = "GPT: Implement", mode = { "v" } },
        -- same as gp.nvim
        -- { "<leader>af", "<cmd>ChatGPTActAs<CR>", description = "GPT: Choose an Agent" },
        -- {
        --   "<leader>ar",
        --   function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":ChatGPTRun <Tab>", true, true, true), "t", true) end,
        --   description = "GPT: Run Specific Actions",
        --   mode = { "n", "v" },
        -- },
        -- { "<leader>ax", "<cmd>ChatGPTRun explain_code<CR>", description = "GPT: Explain Code", mode = { "n", "v" } },
        -- { "<leader>ae", "<cmd>ChatGPTEditWithInstructions<CR>", description = "GPT: Edit with instruction", mode = { "n", "v" } },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Miscellaneous                                            │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<c-s>", ":w<CR>", mode = { "n", "i" }, opts = { noremap = true, silent = true } },
        { "<C-w>o", function() require("mini.misc").zoom() end, description = "Zoom: Toggle" },
        { "<leader>q", "<cmd>wqa<CR>",                          description = "Quit" },
        { "<leader>Q", "<cmd>q!<CR>",                           description = "Force Quit" },
        { "qq", "<cmd>Bdelete<CR>",                             description = "Buffer: Close" },
        { "Q", "<cmd>bdelete<CR>",                              description = "Buffer: Close with Layout" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Miscellaneous (leader m with real keybindings)           │
        -- ╰──────────────────────────────────────────────────────────╯
        -- NOTE: `<leader>ma` and `<leader>mA` taken by `mini.align`
        { "<leader>mb", ":lua require('comment-box').llbox()<CR><Esc>",                    description = "Comment Box: Left-aligned", mode = { "v" } },
        { "<leader>mc", function() require('curl').open_curl_tab() end,                    description = "Open curl (working directory)" },
        { "<leader>mC", function() require('curl').open_global_tab() end,                  description = "Open curl (global)" },
        { "<leader>mn", function() require("noice").cmd("dismiss") end,                    description = "Noice: Dismiss" },
        { "<leader>mt", function() require('mini.trailspace').trim() end,                  description = "Trim All Trailing Whitespace" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Miscellaneous (leader m with random keybindings)         │
        -- ╰──────────────────────────────────────────────────────────╯
        -- general
        { "<leader>MXgea", "<cmd>ScopeMoveBuf<CR>",                                                         description = "Scope: Move Current Buffer to Specified Tab" },
        { "<leader>MXgeb", function() vim.api.nvim_feedkeys(":verbose map <C-i>", "c", false) end,          description = "Find Keybinding Conflict" },
        { "<leader>MXgec", "<cmd>ScrollViewToggle<CR>",                                                     description = "ScrollViewToggle: Enable" },
        { "<leader>MXged", "<cmd>TSContextToggle<CR>",                                                      description = "TSContextToggle: Toggle" },
        { "<leader>MXgee", "<cmd>Telescope notify<CR>",                                                     description = "Notify: Search History" },
        { "<leader>MXgef", function() require('gitignore').generate() end,                                  description = "Generate gitignore" },
        { "<leader>MXgeg", function() require('kulala').run() end,                                          description = "Run kulala" },
        { "<leader>MXgeh", function() require("core.utils").markdown_preview() end,                         description = "Preview Markdown" },

        -- Lazy
        { "<leader>MXlaa", "<cmd>Lazy sync<CR>",                                                            description = "Lazy: Update" },
        { "<leader>MXlab", "<cmd>Lazy clean<CR>",                                                           description = "Lazy: Clean" },

        -- LSP info
        { "<leader>MXlsc", "<cmd>LspInfo<CR>",                                                              description = "LSP: Info" },
        { "<leader>MXlsd", "<cmd>Mason<CR>",                                                                description = "Mason: Info" },
        { "<leader>MXlse", "<cmd>MasonToolsUpdate<CR>",                                                     description = "Mason: Tool Update" },

        -- persisted.nvim
        { "<leader>MXpea", "<cmd>SessionSave<CR>",                                                          description = "Session: Save" },
        { "<leader>MXpeb", "<cmd>SessionLoad<CR>",                                                          description = "Session: Load" },
        { "<leader>MXpec", "<cmd>SessionLoadLast<CR>",                                                      description = "Session: Load Recent Session" },
        { "<leader>MXped", "<cmd>SessionDelete<CR>",                                                        description = "Session: Delete" },

        -- ToggleTerm
        { "<leader>mtev", "<cmd>ToggleTerm direction=vertical<CR>",                                         description = "New terminal (vertical)" },
        { "<leader>mtef", "<cmd>ToggleTerm direction=float<CR>",                                            description = "New terminal (floating)" },

      -- ╭─────────────────────────────────────────────────────────╮
      -- │ g commands                                              │
      -- ╰─────────────────────────────────────────────────────────╯
        {
          "<leader>MXgla",
          ":g/^$/d<CR>",
          mode = { "n", "v" },
          description = "g: Remove Empty Lines",
        },
        {
          "<leader>MXglc",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":g!/^foo$/d<Left><Left><Left>", true, true, true), "t", true) end,
          mode = { "n", "v" },
          description = "g: Delete Lines NOT `foo`",
        },
        {
          "<leader>MXgld",
          ":g/\t/s//    /g<CR>",
          mode = { "n", "v" },
          description = "g: Convert Tabs to Spaces",
        },

        {
          "<leader>MXgle",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":g/foo/norm A.<Left><Left><Left><Left><Left><Left><Left><Left><Left>", true, true, true), "t", true) end,
          mode = { "n", "v" },
          description = "g: Run Normal mode on `foo`",
        },
        {
          "<leader>MXglf",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":g/foo/norm @q<Left><Left><Left><Left><Left><Left><Left><Left><Left>", true, true, true), "t", true) end,
          mode = { "n", "v" },
          description = "g: Run Macro `q` on `foo`",
        },

        {
          "<leader>MXgLg",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":g/foo/t $<Left><Left><Left><Left>", true, true, true), "t", true) end,
          mode = { "n", "v" },
          description = "g: (t)ransfer `foo` to End of File",
        },
        {
          "<leader>MXgLh",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":g/foo/.,+2t $<Left><Left><Left><Left><Left><Left><Left><Left>", true, true, true), "t", true) end,
          mode = { "n", "v" },
          description = "g: (t)ransfer `foo` with 2 lines below to End of File",
        },

        {
          "<leader>MXgLi",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":g/foo/m $<Left><Left><Left><Left>", true, true, true), "t", true) end,
          mode = { "n", "v" },
          description = "g: (m)ove `foo` to End of File",
        },
        {
          "<leader>MXgLj",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":g/foo/.,+2m $<Left><Left><Left><Left><Left><Left><Left><Left>", true, true, true), "t", true) end,
          mode = { "n", "v" },
          description = "g: (m)ove `foo` with 2 lines below to End of File",
        },

        {
          "<leader>MXgLk",
          function()
             vim.fn.setreg('a', '')
             vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":g/foo/y A<Left><Left><Left><Left>", true, true, true), "t", true) 
          end,
          mode = { "n", "v" },
          description = "g: yank `foo` to reg a",
        },
        {
          "<leader>MXgLl",
          function()
            vim.fn.setreg('a', '')
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":g/foo/.,+2y A<Left><Left><Left><Left><Left><Left><Left><Left>", true, true, true), "t", true) 
          end,
          mode = { "n", "v" },
          description = "g: yank `foo` with 2 lines below it to reg a",
        },

      -- ╭─────────────────────────────────────────────────────────╮
      -- │ External commands                                       │
      -- ╰─────────────────────────────────────────────────────────╯
        {
          "<leader>MXexa",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":w !jq '. | length' <Left><Left>", true, true, true), "t", true) end,
          description = "jq: Get Length",
        },
        {
          "<leader>MXexb",
          ":w! /tmp/nvim_jqp | silent !tmux split-window -h \"jqp < /tmp/nvim_jqp\"<CR>",
          description = "jqp: Split Window",
        },
        {
          "<leader>MXexc",
          ":w! /tmp/nvim_jqp | silent !tmux new-window \"jqp < /tmp/nvim_jqp\"<CR>",
          description = "jqp: New Window",
        },
        {
          "<leader>MXexd",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":%!tail -n +2 | cut -d',' -f2 | sort | uniq | wc -l<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>", true, true, true), "t", true) end,
          description = "csv: count unique in 2nd column",
        },

      -- ╭─────────────────────────────────────────────────────────╮
      -- │ substitute                                              │
      -- ╰─────────────────────────────────────────────────────────╯
        {
          '<leader>MXsua',
          function()
            if require("legendary.toolbox").is_visual_mode() then
                vim.api.nvim_feedkeys(":s/\\s.*//gc", "c", false)
            else
                vim.api.nvim_feedkeys(":%s/\\s.*//gc", "c", false)
            end
          end,
          mode = { 'n', 'v' },
          description = 'Delete Everything After a space',
        },
        {
          "<leader>MXsub",
          ":%s/[’‘]/'/ge | %s/[“”＂]/\"/ge<CR>",
          description = "Delete All Weird Curly Quotes",
        },
        {
          "<leader>MXsuf",
          function() vim.api.nvim_feedkeys(":s/\\vfoo/&bar/gc", "c", false) end,
          mode = { "n", "v" },
          description = "Substitute: `foo` into `foobar`",
        },
      },
  },
}
