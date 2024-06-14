return {
  "mrjones2014/legendary.nvim",
  event = "VeryLazy",
  enabled = not vim.g.started_by_firenvim,
  dependencies = { "kkharji/sqlite.lua", "stevearc/dressing.nvim" },
  config = function()
    local toolbox = require("legendary.toolbox")
    require("legendary").setup({
      include_builtin = false,
      include_legendary_cmds = false,
      sort = {
        -- NOTE: this takes precedence over other sort options
        frecency = {
          db_root = string.format("%s/legendary/", vim.fn.stdpath("data")),
          max_timestamps = 20,
        },
      },
      -- stylua: ignore
      keymaps = {
        -- NOTE: the following are available:
        -- J!!, K!!, H, L, gh, r
        -- gj, gk, mm, MM
        -- ,
        -- C-j, C-k, C-e, C-y
        -- <leader> h, i, k, p, u, v, w, y, z

        -- <leader>g
        { "<leader>gu", "<cmd>UndotreeToggle<CR>", description = "Undotree: Toggle" },

        { "<leader>e", "<cmd>lua require('yazi').yazi()<CR>", description = "Yazi" },

        { "-", "<cmd>Oil --float<CR>", description = "Oil" },
        { "X", "<cmd>ISwapWith<CR>", description = "Swap Two Adjacent Nodes" },
        { "gs", function() require("flash").treesitter() end, description = "Flash Treesitter", mode = { "n", "x", "o" } },

        -- <C-KEY>
        { "<C-a>", require("dial.map").inc_normal(), description = "Increment" },
        { "<C-x>", require("dial.map").dec_normal(), description = "Decrement" },
        {
          "<C-f>",
          function() require("nvim-tree.api").tree.toggle({ find_file = true }) end,
          description = "Tree: Toggle With Focused File",
        },
        {
          "<C-S-f>",
          function() require("nvim-tree.api").tree.toggle({ find_file = false }) end,
          description = "Tree: Toggle Without Focused File",
        },
        { "<C-q>", "<cmd>LazyGit<CR>", description = "Lazygit" },
        { "<C-t>", "<cmd>ToggleTerm<CR>", description = "New terminal" },

        {
          "<C-g>",
          function() require("core.utils").find_files_from_project_git_root() end,
          description = "Telescope: Find Files",
        },

        -- { "<C-p>", "<cmd>Legendary<CR>", description = "Legendary Command Palette", mode = { "n", "x" } },
        {
          "<C-p>",
          function()
            require("legendary").find({
              formatter = function(item, _)
                -- remove first column
                local values = require("legendary.ui.format").default_format(item)
                values[1] = ""
                return values
              end,
            })
          end,
          description = "Legendary Command Palette",
          mode = { "n", "x" },
        },

        -- { "<C-f>", '<C-R>"', description = "Paste Last Yanked / Deleted", mode = { "i" } },
        { "<C-v>", "<C-R>*", description = "Paste Clipboard Content", mode = { "i", "x" } },

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
            v = function()
              local text = require("core.utils").get_visual_selection()
              require("telescope.builtin").current_buffer_fuzzy_find({ default_text = text })
            end,
          },
          description = "Telescope: Find Text in Current Buffer",
        },
        -- not frequent below
        { "<leader>fp", "<cmd>Telescope neoclip<CR>", description = "Telescope: Clipboard" },
        { "<leader>fu", "<cmd>Telescope undo<CR>", description = "Telescope: Undo" },
        { "<leader>fB", "<cmd>Telescope scope buffers<CR>", description = "Telescope: Tabs" },
        {
          "<leader>ff",
          "<cmd>lua require('telescope.builtin').find_files()<CR>",
          description = "Telescope: Find Files in Current Directory",
        },
        { "<leader>fd", "<cmd>Telescope frecency workspace=CWD<CR>", description = "Telescope: Find Frecency" },
        {
          "<leader>fz",
          '<cmd>lua require("telescope").extensions.zoxide.list()<CR>',
          description = "Telescope: Zoxide",
        },
        { "<leader>fr", "<cmd>Telescope resume<CR>", description = "Telescope: Resume" },
        { "<leader>fj", "<cmd>Telescope jumplist<CR>", description = "Telescope: Jumplist" },

        { "<leader>fXc", "<cmd>Telescope command_history<CR>", description = "Telescope: Command History" },
        { "<leader>fXs", "<cmd>Telescope search_history<CR>", description = "Telescope: Search History" },

        {
          "<leader>fs",
          '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
          description = "Spectre: Search in File",
        },
        {
          "<leader>fS",
          function() require("spectre").open({ cwd = vim.fn.getcwd(), is_insert_mode = false, is_close = true, }) end,
          description = "Spectre: Search in Project",
        },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ LSP                                                      │
        -- ╰──────────────────────────────────────────────────────────╯
        -- it'll show with code action
        { "gl", "<cmd>Lspsaga diagnostic_jump_next<CR>", description = "LSP: Line Diagnostics" },
        -- { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", description = "LSP: Line Diagnostics" },
        { "gL", "<cmd>Lspsaga show_buf_diagnostics<CR>", description = "LSP: Buffer Diagnostics" },
        { "gh", "<cmd>Lspsaga hover_doc ++quiet<CR>", description = "LSP: Hover Doc (quiet)" },
        { "gH", "<cmd>Lspsaga hover_doc ++keep<CR>", description = "LSP: Hover Doc (keep)" },

        { "gd", "<cmd>Lspsaga goto_definition<CR>", description = "LSP: Go to Definition" },
        { "gD", "<cmd>Lspsaga peek_definition<CR>", description = "LSP: Preview Definition" },

        { "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", description = "LSP: Go to Type Definition" },

        { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", description = "LSP: Reference List" },
        {
          "gR",
          function() require("trouble").toggle("lsp_references") end,
          description = "LSP: Reference List",
        },
        {
          "<leader>lw",
          function() require("trouble").toggle("workspace_diagnostics") end,
          description = "LSP: Workspace Diagnostics",
        },
        {
          "<leader>ld",
          function() require("trouble").toggle("document_diagnostics") end,
          description = "LSP: Document Diagnostics",
        },

        -- order of importance
        { "<leader>la", "lua require('wtf').ai()", description = "WTF: Debug diagnostic" },
        { "<leader>lc", "<cmd>Lspsaga code_action<CR>", description = "LSP: Code Action" },
        {
          "<leader>lf",
          "<cmd>Lspsaga finder<CR>",
          description = "LSP: Finder: Symbol, Definition and Implementation",
        },
        -- After the LSP rename is done, and if the name still exists somewhere within the project, project_replace window would pop out
        { "<leader>lr", "<cmd>Lspsaga lsp_rename ++project<CR>", description = "LSP: Rename" },
        {
          "<leader>lp",
          "<cmd>TSToolsRenameFile<CR>",
          description = "LSP: Rename Current File",
          filters = { filetype = "javascriptreact", "typescriptreact" },
        },
        { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", description = "LSP: Signature Help" },
        -- { "<leader>ln", "<cmd>Navbuddy<CR>", description = "LSP: Navbuddy" },
        { "<leader>lo", "<cmd>Lspsaga outline<CR>", description = "LSP: Symbols Outline" },

        { "<leader>lXc", "<cmd>lua vim.lsp.codelens.run()<CR>", description = "LSP: Code Lens" },
        { "<leader>lXd", "<cmd>lua vim.lsp.buf.declaration<CR>", description = "LSP: Declaration" },
        { "<leader>lXf", "<cmd>lua vim.lsp.buf.format()<CR>", description = "LSP: Formatting" },

        -- lesser used
        -- implementation (rarely) using `Lspsaga lsp_finder`
        -- { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", description = "LSP: Go to Implementation" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Trouble.nvim                                             │
        -- ╰──────────────────────────────────────────────────────────╯
        {
          "<leader>xx",
          function() require("trouble").toggle() end,
          description = "Trouble: Toggle",
        },
        {
          "<leader>xt",
          "<cmd>TodoTelescope keywords=TODO<CR>",
          description = "Trouble: Only TODO",
        },
        {
          "<leader>xT",
          "<cmd>TodoTelescope<CR>",
          description = "Trouble: All TODO",
        },

        -- ╭─────────────────────────────────────────────────────────╮
        -- │ quickfix                                                │
        -- ╰─────────────────────────────────────────────────────────╯
        { "<leader>co", "<cmd>copen<CR>", description = "Quickfix List" },
        {
          "<leader>cd",
          function() vim.api.nvim_feedkeys(":cdo s/foo/bar/gc | update", "c", false) end,
          description = "cdo: Execute Command on Quickfix Entries",
          -- filters = { filetype = "qf", "Trouble" },
        },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ bufferline                                               │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<C-h>", "<cmd>BufferLineCyclePrev<CR>", description = "Buffer: Move to Previous" },
        { "<C-l>", "<cmd>BufferLineCycleNext<CR>", description = "Buffer: Move to Next" },
        { "<A-,>", "<cmd>BufferLineMovePrev<CR>", description = "Buffer: Re-order to Previous" },
        { "<A-.>", "<cmd>BufferLineMoveNext<CR>", description = "Buffer: Re-order to Next" },
        { "g1", "<cmd>BufferLineGoToBuffer 1<CR>", description = "Buffer: Go to 1" },
        { "g2", "<cmd>BufferLineGoToBuffer 2<CR>", description = "Buffer: Go to 2" },
        { "g3", "<cmd>BufferLineGoToBuffer 3<CR>", description = "Buffer: Go to 3" },
        { "g4", "<cmd>BufferLineGoToBuffer 4<CR>", description = "Buffer: Go to 4" },
        { "g5", "<cmd>BufferLineGoToBuffer 5<CR>", description = "Buffer: Go to 5" },
        { "g6", "<cmd>BufferLineGoToBuffer 6<CR>", description = "Buffer: Go to 6" },
        { "g7", "<cmd>BufferLineGoToBuffer 7<CR>", description = "Buffer: Go to 7" },
        { "g8", "<cmd>BufferLineGoToBuffer 8<CR>", description = "Buffer: Go to 8" },
        { "g9", "<cmd>BufferLineGoToBuffer 9<CR>", description = "Buffer: Go to 9" },
        { "g0", "<cmd>BufferLineGoToBuffer -1<CR>", description = "Buffer: Go to 10" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Tab (for scope.nvim)                                     │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<leader>th", "<cmd>tabprev<CR>", description = "Tab: Previous" },
        { "<leader>tl", "<cmd>tabnext<CR>", description = "Tab: Next" },
        { "<leader>tn", "<cmd>tabnew<CR>", description = "Tab: New" },
        { "<leader>tc", "<cmd>tabclose<CR>", description = "Tab: Close" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ tmux.lua                                                 │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<A-h>", toolbox.lazy_required_fn("tmux", "move_left"), description = "Move Focus to Left" },
        { "<A-l>", toolbox.lazy_required_fn("tmux", "move_right"), description = "Move Focus to Right" },
        { "<A-k>", toolbox.lazy_required_fn("tmux", "move_top"), description = "Move Focus to Top" },
        { "<A-j>", toolbox.lazy_required_fn("tmux", "move_bottom"), description = "Move Focus to Bottom" },
        { "<C-S-h>", toolbox.lazy_required_fn("tmux", "resize_left"), description = "Resize Left" },
        { "<C-S-l>", toolbox.lazy_required_fn("tmux", "resize_right"), description = "Resize Right" },
        { "<C-S-k>", toolbox.lazy_required_fn("tmux", "resize_top"), description = "Resize Top" },
        { "<C-S-j>", toolbox.lazy_required_fn("tmux", "resize_bottom"), description = "Resize Bottom" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Diffview.nvim                                            │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<leader>do", "<cmd>DiffviewOpen<CR>", description = "Diffview: Open" },
        {
          "<leader>dh",
          "<cmd>DiffviewOpen HEAD^!<CR>",
          description = "Diffview: Current Commit and Prior Commit",
        },
        {
          "<leader>dH",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":DiffviewOpen HEAD~3", true, true, true), "t", true) end,
          description = "Diffview: HEAD and n Prior Commits",
        },
        {
          "<leader>daa",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":DiffviewOpen d4a7b0d", true, true, true), "t", true) end,
          description = "Diffview: Compares Changes Made by `d4a7b0d` with Current Working Directory",
        },

        {
          "<leader>dab",
          function() vim.api.nvim_feedkeys( vim.api.nvim_replace_termcodes(":DiffviewOpen d4a7b0d^!<Left><Left>", true, true, true), "t", true) end,
          description = "Diffview: Changes Made in the Single `d4a7b0d`",
        },

        {
          "<leader>dac",
          function() vim.api.nvim_feedkeys( vim.api.nvim_replace_termcodes( ":DiffviewOpen d4a7b0d..519b30e <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>", true, true, true), "t", true) end,
          description = "Diffview: Changes Between 2 Commits (from `d4a7b0d` up to `519b30e`, Inclusive).",
        },

        {
          "<leader>db",
          "<cmd>DiffviewFileHistory<CR>",
          description = "Diffview: File History of Current Branch",
        },
        {
          "<leader>df",
          "<cmd>DiffviewFileHistory %<CR>",
          description = "Diffview: File History of Current File",
        },
        {
          "<leader>dr",
          "<cmd>'<,'>DiffviewFileHistory<CR>",
          description = "Diffview: Line History of Range of Current File",
          mode = "v",
        },
        {
          "<leader>dXl",
          "<cmd>Gitsigns toggle_current_line_blame<CR>",
          description = "Diffview: Toggle Current Line Blame",
        },
        -- { "<leader>dg", "<cmd>Gitsigns preview_hunk<CR>", description = "Diffview: Preview Hunk" },

        -- {
        --   "<C-t>",
        --   "<cmd>DiffviewToggleFiles<CR>",
        --   description = "Diffview: Toggle File Panel",
        --   filters = { bt = { "DiffviewFiles", "DiffviewFileHistory" } },
        -- },
        -- {
        --   "<C-r>",
        --   "<cmd>DiffviewRefresh<CR>",
        --   description = "Diffview: Refresh",
        --   filters = { bt = { "DiffviewFiles", "DiffviewFileHistory" } },
        -- },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Run Code                                                 │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<leader>rf", "<cmd>RunCode<CR>", description = "Run File" },
        { "<leader>rs", "<cmd>SnipRun<CR>", description = "Run Snip" },
        { "<leader>rc", "<cmd>SnipClose<CR>", description = "Close Snip" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ scratcn.nvim                                             │
        -- ╰──────────────────────────────────────────────────────────╯
        {
          "<leader>so",
          function() require("scratch.scratch_file").createScratchFileByType("md") end,
          description = "Scratch: New File",
        },
        {
          "<leader>ss",
          function() require("core.utils").toggle_scratchpad() end,
          description = "Scratch: Toggle ScratchPad",
        },
        {
          "<leader>sf",
          "<cmd>ScratchOpenFzf<CR>",
          description = "Scratch: Find File Contents",
        },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ gp.nvim                                                  │
        -- ╰──────────────────────────────────────────────────────────╯
        {
          "<leader>sp",
          function() require("core.utils").get_current_buffer_content() end,
          description = "GPT: Get Current Buffer Content",
        },
        {
          "<leader>sP",
          function() require("core.utils").get_all_buffer_content() end,
          description = "GPT: Get All Buffer Content",
        },
        -- {
        --   "<leader>sf",
        --   function()
        --     require("core.utils").gp_choose_agent()
        --   end,
        --   description = "GPT: Choose an Agent",
        -- },
        -- {
        --   "<leader>so",
        --   function()
        --     vim.api.nvim_exec("GpChatNew vsplit", false)
        --     vim.api.nvim_win_set_width(0, 80)
        --     vim.api.nvim_exec("GpAgent Ultimate-Assistant", false)
        --   end,
        --   description = "GPT: Ultimate Assistant",
        -- },
        -- {
        --   "<leader>ss",
        --   function()
        --     vim.api.nvim_exec("GpChatToggle vsplit", false)
        --     vim.api.nvim_win_set_width(0, 80)
        --   end,
        --   description = "GPT: Toggle",
        -- },
        -- {
        --   "<leader>sg",
        --   function()
        --     require("telescope").extensions.egrepify.egrepify({
        --       cwd = os.getenv("HOME") .. "/.local/share/nvim/gp/chats",
        --     })
        --   end,
        --   description = "GPT: Finder",
        -- },
        -- {
        --   "<leader>sa",
        --   "<cmd>GpAppend<CR>",
        --   description = "GPT: Append",
        -- },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ AI                                                       │
        -- ╰──────────────────────────────────────────────────────────╯
        { "<leader>ao", "<cmd>ChatGPT<CR>", description = "GPT: Open" },
        { "<leader>ai", "<cmd>'<,'>GpImplement<CR>", description = "GPT: Implement", mode = { "v" } },

        -- same as gp.nvim
        { "<leader>af", "<cmd>ChatGPTActAs<CR>", description = "GPT: Choose an Agent" },
        {
          "<leader>ar",
          function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":ChatGPTRun <Tab>", true, true, true), "t", true) end,
          description = "GPT: Run Specific Actions",
          mode = { "n", "v" },
        },
        {
          "<leader>ax",
          "<cmd>ChatGPTRun explain_code<CR>",
          description = "GPT: Explain Code",
          mode = { "n", "v" },
        },
        {
          "<leader>ae",
          "<cmd>ChatGPTEditWithInstructions<CR>",
          description = "GPT: Edit with instruction",
          mode = { "n", "v" },
        },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Miscellaneous Keymaps                                    │
        -- ╰──────────────────────────────────────────────────────────╯
        {
          "<c-s>",
          "<cmd>w<CR>",
          mode = { "n", "i" },
          opts = { noremap = true, silent = true },
        },
        { "<C-w>o", function() require("mini.misc").zoom() end, description = "Zoom: Toggle" },

        { "<leader>q", "<cmd>wqa<CR>", description = "Quit" },
        { "<leader>Q", "<cmd>q!<CR>", description = "Force Quit" },
        { "qq", "<cmd>Bdelete<CR>", description = "Buffer: Close" },
        -- { "Q", "<cmd>close<CR>", description = "Window: Close" },

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Miscellaneous (leader m with real keybindings)           │
        -- ╰──────────────────────────────────────────────────────────╯
        -- NOTE: `<leader>ma` and `<leader>mA` taken by `mini.align`
        -- NOTE: `<leader>ms` taken by `mini.operators`
        {
          "<leader>mc",
          "<cmd>BufferLineCloseOthers<CR>",
          description = "Buffer: Close All But Current",
        },
        {
          -- https://github.com/nvim-treesitter/nvim-treesitter#i-experience-weird-highlighting-issues-similar-to-78
          "<leader>mr",
          "<cmd>wa | edit | lua vim.lsp.buf.format()<CR> | TSBufEnable highlight<CR>zz",
          description = "Treesitter: Reload",
        },
        {
          "<leader>mb",
          "<cmd>lua require('comment-box').llbox()<CR><Esc>",
          description = "Comment Box: Left-aligned",
          mode = { "v" },
        },
        {
          "<leader>mn",
          "<cmd>Noice dismiss<Esc>",
          description = "Noice: Dismiss",
        },
        {
          "<leader>mt",
          "<cmd>lua MiniTrailspace.trim()<CR>",
          description = "Trim All Trailing Whitespace",
        },
        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Miscellaneous (leader m with random keybindings)         │
        -- ╰──────────────────────────────────────────────────────────╯
        -- persisted.nvim
        { "<leader>MXss", "<cmd>SessionSave<CR>", description = "Session: Save" },
        { "<leader>MXsr", "<cmd>SessionLoad<CR>", description = "Session: Load" },
        { "<leader>MXsR", "<cmd>SessionLoadLast<CR>", description = "Session: Load Recent Session" },
        { "<leader>MXsd", "<cmd>SessionDelete<CR>", description = "Session: Delete" },

        --  ╭──────────────────────────────────────────────────────────╮
        --  │ leetcode                                                 │
        --  ╰──────────────────────────────────────────────────────────╯
        { "<leader>MXLm", "<cmd>Leet Menu<CR>", description = "LeetCode: Opens Menu Dashboard" },
        {
          "<leader>MXLc",
          "<cmd>Leet console<CR>",
          description = "LeetCode: Opens Console For Currently Opened Question",
        },
        {
          "<leader>MXLq",
          "<cmd>Leet tabs<CR>",
          description = "LeetCode: Opens A Picker With All Currently Opened Question Tabs",
        },
        { "<leader>MXLd", "<cmd>Leet desc<CR>", description = "LeetCode: Toggle Question Description" },
        { "<leader>MXLr", "<cmd>Leet run<CR>", description = "LeetCode: Run Currently Opened Question" },
        { "<leader>MXLs", "<cmd>Leet submit<CR>", description = "LeetCode: Submit Currently Opened Question" },

        -- ╭─────────────────────────────────────────────────────────╮
        -- │ vim-caser                                               │
        -- ╰─────────────────────────────────────────────────────────╯
        {
          "<leader>MXtu",
          "<Plug>CaserVUpperCase",
          description = "Constant case: LOREM_IPSUM",
          mode = { "v" },
        },
        {
          "<leader>MXts",
          "<Plug>CaserVSnakeCase",
          description = "Snake case: lorem_ipsum",
          mode = { "v" },
        },
        {
          "<leader>MXtxd",
          "<Plug>CaserVKebabCase",
          description = "Dash case: lorem-ipsum",
          mode = { "v" },
        },
        {
          "<leader>MXtc",
          "<Plug>CaserVSpaceCase",
          description = "space case: lorem ipsum",
          mode = { "v" },
        },
        {
          "<leader>MXtd",
          "<Plug>CaserVDotCase",
          description = "Dot case: lorem.ipsum",
          mode = { "v" },
        },
        {
          "<leader>MXtxbp",
          "<Plug>CaserVSentenceCase",
          description = "Sentence case: Lorem ipsum",
          mode = { "v" },
        },
        {
          "<leader>MXtxap",
          "<Plug>CaserVMixedCase",
          description = "Pascal case: LoremIpsum",
          mode = { "v" },
        },
        {
          "<leader>MXtt",
          "<Plug>CaserVTitleCase",
          description = "Title case: Lorem Ipsum",
          mode = { "v" },
        },
        {
          "<leader>MXtd",
          "<Plug>CaserVTitleKebabCase",
          description = "Title dash case: Lorem-Ipsum",
          mode = { "v" },
        },
        {
          "<leader>MXtc",
          "<Plug>CaserVCamelCase",
          description = "Camel case: loremIpsum",
          mode = { "v" },
        },

        -- ╭─────────────────────────────────────────────────────────╮
        -- │ jdtls                                                   │
        -- ╰─────────────────────────────────────────────────────────╯
        {
          "<leader>MXja",
          "<cmd>JdtWipeDataAndRestart<CR>",
          filters = { filetype = "java" },
          description = "jdtls: Wipe Data and Restart",
        },
        {
          "<leader>MXjb",
          "<cmd>JdtUpdateConfig<CR>",
          filters = { filetype = "java" },
          description = "jdtls: Update Config",
        },
        {
          "<leader>MXjc",
          "<cmd>lua require'jdtls'.organize_imports()<CR>",
          filters = { filetype = "java" },
          description = "jdtls: Organize Import",
        },
        {
          "<leader>MXjd",
          "<cmd>lua require('jdtls').extract_variable()<CR>",
          filters = { filetype = "java" },
          description = "jdtls: Extract Variable",
        },
        {
          "<leader>MXje",
          "<cmd>lua require('jdtls').extract_variable(true)<CR>",
          filters = { filetype = "java" },
          description = "jdtls: Extract Variable",
          mode = { "v" },
        },
        {
          "<leader>MXjf",
          "<cmd>lua require('jdtls').extract_constant()<CR>",
          filters = { filetype = "java" },
          description = "jdtls: Extract Constant",
        },
        {
          "<leader>MXjg",
          "<Esc><cmd>lua require('jdtls').extract_constant(true)<CR>",
          filters = { filetype = "java" },
          description = "jdtls: Extract Constant",
          mode = { "v" },
        },
        {
          "<leader>MXjh",
          "<Esc><cmd>lua require('jdtls').extract_method(true)<CR>",
          filters = { filetype = "java" },
          description = "jdtls: Extract Method",
          mode = { "v" },
        },

        -- Lazy
        { "<leader>MXls", "<cmd>Lazy sync<CR>", description = "Lazy: Update" },
        { "<leader>MXlc", "<cmd>Lazy clean<CR>", description = "Lazy: Clean" },
        -- LSP info
        { "<leader>MXli", "<cmd>LspInfo<CR>", description = "LSP: Info" },
        { "<leader>MXlm", "<cmd>Mason<CR>", description = "Mason: Info" },
        { "<leader>MXlx", "<cmd>MasonToolsUpdate<CR>", description = "Mason: Tool Update" },

        -- ╭─────────────────────────────────────────────────────────╮
        -- │ global commands                                         │
        -- ╰─────────────────────────────────────────────────────────╯
        {
          "<leader>MXgga",
          function() vim.api.nvim_feedkeys(":g/^$/d", "c", false) end,
          description = "g: Remove Empty Lines",
        },
        {
          "<leader>MXggb",
          function() vim.api.nvim_feedkeys(":g/^foo$/d", "c", false) end,
          description = "g: Delete Lines Only Contain foo",
        },
        {
          "<leader>MXggc",
          function() vim.api.nvim_feedkeys(":g!/^foo$/d", "c", false) end,
          description = "g: Delete Lines NOT foo",
        },
        {
          "<leader>MXgge",
          function() vim.api.nvim_feedkeys(":g/foo/normal! A;", "c", false) end,
          description = "g: Run Normal Mode Containing foo",
        },
        {
          "<leader>MXggf",
          function() vim.api.nvim_feedkeys(":g/foo/normal! @a", "c", false) end,
          description = "g: Run Macro Containing foo",
        },
        {
          "<leader>MXggh",
          function() vim.api.nvim_feedkeys(":g/foo/t $", "c", false) end,
          description = "g: t (copy) foo to End of File",
        },
        {
          "<leader>MXggi",
          function() vim.api.nvim_feedkeys(":g/foo/m $", "c", false) end,
          description = "g: (m)ove foo to End of File",
        },

        -- ╭─────────────────────────────────────────────────────────╮
        -- │ Substitute                                              │
        -- ╰─────────────────────────────────────────────────────────╯
        {
          "<leader>MXsel",
          function() vim.api.nvim_feedkeys(":s/$/foo", "c", false) end,
          description = "Visual Mode: Add `foo` to End Of Line",
          mode = { "v" },
        },
        {
          "<leader>MXsela",
          function() vim.api.nvim_feedkeys(":s/\\vfoo/&bar/gc", "c", false) end,
          description = "Visual Mode: `foo` into `foobar`",
          mode = { "v" },
        },
        {
          "<leader>MXselb",
          function() vim.api.nvim_feedkeys(":s/\\v(foo)(.*)(bar)/\\3\\2\\1/gc", "c", false) end,
          description = "Visual Mode: swap `foo` with `bar`",
          mode = { "v" },
        },

        -- ╭─────────────────────────────────────────────────────────╮
        -- │ misc                                                    │
        -- ╰─────────────────────────────────────────────────────────╯
        {
          "<leader>MXbm",
          "<cmd>ScopeMoveBuf<CR>",
          description = "Scope: Move Current Buffer to Specified Tab",
        },
        {
          "<leader>MXta",
          function() vim.api.nvim_feedkeys(":verbose map <C-i>", "c", false) end,
          description = "Find Keybinding Conflict",
        },
        {
          "<leader>MXld",
          function() vim.api.nvim_feedkeys(":ldo s/foo/bar/gc | update", "c", false) end,
          description = "ldo: Execute Command on Location List Entries",
          filters = { filetype = "qf", "Trouble" },
        },

        {
          "<leader>MXxp",
          function() require("core.utils").markdown_preview() end,
          description = "Preview Markdown",
        },

        { "<leader>MXsXe", "<cmd>ScrollViewToggle<CR>", description = "ScrollViewToggle: Enable" },
        { "<leader>MXsd", "<cmd>TSContextToggle<CR>", description = "TSContextToggle: Toggle" },
        {
          "<leader>MXrts",
          "<cmd>%s/\t/  /g<CR>",
          description = "Convert Tabs to Spaces",
        },
        {
          "<leader>MXttes",
          "<cmd>'<,'>s/ .*//gc<CR>",
          description = "Delete Everything After a Space",
          mode = { "x" },
        },
        {
          "<leader>MXraw",
          "<cmd>%s/\\s\\+$//e<CR>",
          description = "Remove All Whitespace",
        },

        {
          "<leader>MXrsq",
          "<cmd>%s/[’‘]/'/g<CR>",
          description = "Replace All Single Curly Quotes",
        },
        {
          "<leader>MXrdq",
          '<cmd>%s/[“”]/"/g<CR>',
          description = "Replace All Double Curly Quotes",
        },
        {
          "<leader>MXrqq",
          '<cmd>%s/0 " "//g<CR>',
          description = "hledger: Remove Zero Quote Quote",
          filters = { filetype = "ledger" },
        },
      },
    })
  end,
}
