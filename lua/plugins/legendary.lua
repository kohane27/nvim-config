local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
  print("legendary failing")
end

legendary.setup({
  include_builtin = false,
  keymaps = {
    -- <C-KEY>
    { "<C-t>", "<cmd>NvimTreeToggle<CR>", description = "Toggle Tree" },
    { "<C-g>", "<cmd>Telescope find_files<CR>", description = "Find Files" },
    { "<C-l>", "<cmd>Legendary<CR>", description = "Legendary" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ EnhancedJumps                                            │
    -- ╰──────────────────────────────────────────────────────────╯
    -- " only local jumps
    { "<C-o>", "<Plug>EnhancedJumpsLocalOlder", description = "EnhancedJumpsLocalOlder" },
    { "<C-i>", "<Plug>EnhancedJumpsLocalNewer", description = "EnhancedJumpsLocalNewer" },
    -- { "<C-o>", "<cmd>call EnhancedJumpsLocalOlder()<CR>", description = "EnhancedJumpsLocalOlder" },
    -- { "<C-i>", "<cmd>call EnhancedJumpsLocalNewer()<CR>", description = "EnhancedJumpsLocalNewer" },

    -- " only remote jumps
    { "<A-o>", "<Plug>EnhancedJumpsRemoteOlder", description = "EnhancedJumpsRemoteOlder" },
    { "<A-i>", "<Plug>EnhancedJumpsRemoteNewer", description = "EnhancedJumpsRemoteNewer" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Telescope                                                │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", description = "Find Text" },
    {
      "<leader>ff",
      "<cmd>Telescope current_buffer_fuzzy_find case_mode=ignore_case<CR>",
      description = "Find Text in Buffers",
    },
    { "<leader>fF", "<cmd>Telescope frecency<CR>", description = "Find Frecency" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>", description = "Open Recent File" },
    { "<leader>fp", "<cmd>Telescope projects<CR>", description = "Find Projects" },
    { "<leader>fr", "<cmd>Telescope neoclip<CR>", description = "Find Clipboard History" },
    { "<leader>ft", "<cmd>Telescope telescope-tabs list_tabs<CR>", description = "Find Tabs" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ LSP                                                      │
    -- ╰──────────────────────────────────────────────────────────╯
    { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", description = "Go to Definition" },
    { "gD", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", description = "Preview Definition" },
    -- {"gD", "<cmd>Lspsaga peek_definition<CR>", description = "Preview Definition"},

    { "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", description = "Go to Type Definition" },
    {
      "<leader>lT",
      "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
      description = "Preview Type Definition",
    },

    -- implementation (rarely)
    { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", description = "Go to Implementation" },
    {
      "<leader>lI",
      "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",

      description = "Preview Implementation",
    },
    { "<leader>la", "<cmd>Lspsaga code_action<CR>", description = "Code Action" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", description = "Code Lens" },
    { "<leader>lr", "<cmd>Trouble lsp_references<CR>", description = "Reference List" },
    {
      "<leader>lR",
      "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
      description = "Preview Reference List",
    },
    { "<leader>ln", "<cmd>Lspsaga rename<CR>", description = "Rename" },
    { "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", description = "Hover Doc" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", description = "Formatting" },
    { "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", description = "Go to Previous Diagnostic" },
    { "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", description = "Go to Next Diagnostic" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ barbar.lua                                               │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<A-,>", ":BufferPrevious<CR>", description = "Move to Previous Buffer" },
    { "<A-.>", ":BufferNext<CR>", description = "Move to Next Buffer" },
    { "<A-<>", ":BufferMovePrevious<CR>", description = "Re-order to Previous Buffer" },
    { "<A->>", " :BufferMoveNext<CR>", description = "Re-order to Next Buffer" },
    { "<A-c>", ":BufferClose<CR>", description = "Close Buffer" },
    -- {"<A-c>", ":BufferCloseAllButCurrent<CR>", description = "Buffer Close All But Current"},
    -- {"<A-p>", ":BufferPin<CR>", description = "Toggle Pin"},
    -- {"<A-C>", ":BufferCloseAllButPinned<CR>", description = "BufferCloseAllButPinned"},
    -- {"<A-C>", ":BufferCloseAllButCurrentOrPinned<CR>", description = "BufferCloseAllButCurrentOrPinned"},

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ comment_box                                              │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<leader>mb",
      { v = '<cmd>lua require("comment-box").lbox()<CR>' },
      description = "left aligned fixed size box with left aligned text",
    },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ neozoom                                                  │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<C-w>o",
      function()
        vim.cmd("NeoZoomToggle")
      end,
      description = "Toggle NeoZoom",
    },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ substitute.lua                                           │
    -- ╰──────────────────────────────────────────────────────────╯
    { "cx", "<cmd>lua require('substitute.exchange').operator()<CR>", description = "Substitute Exchange Operator" },
    { "cxx", "<cmd>lua require('substitute.exchange').line()<CR>", description = "Substitute Exchange Line" },
    -- map("x", "cx", "<cmd>lua require('substitute.exchange').visual()<CR>", description = "Substitute Exchange Line"},
    { "cxc", "<cmd>lua require('substitute.exchange').cancel()<CR>", description = "Substitute Exchange Cancel" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ tmux.lua                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<A-h>", "<cmd>lua require('tmux').move_left()<CR>", description = "Move Focus to Left" },
    { "<A-l>", "<cmd>lua require('tmux').move_right()<CR>", description = "Move Focus to Right" },
    { "<A-k>", "<cmd>lua require('tmux').move_top()<CR>", description = "Move Focus to Top" },
    { "<A-j>", "<cmd>lua require('tmux').move_bottom()<CR>", description = "Move Focus to Bottom" },

    { "<C-Left>", "<cmd>lua require('tmux').resize_left()<CR>", description = "Resize Left" },
    { "<C-Right>", "<cmd>lua require('tmux').resize_right()<CR>", description = "Resize Right" },
    { "<C-Up>", "<cmd>lua require('tmux').resize_top()<CR>", description = "Resize Top" },
    { "<C-Down>", "<cmd>lua require('tmux').resize_bottom()<CR>", description = "Resize Bottom" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Git                                                      │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>gl", "<cmd>FloatermNew --height=1.0 --width=1.0 --wintype=float lazygit<CR>", description = "lazygit" },
    { "<leader>gd", "<cmd>DiffviewOpen<CR>", description = "git diff index" },
    { "<leader>gf", "<cmd>DiffviewFileHistory<CR>", description = "git File History" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", description = "git Status" },
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", description = "git Commits" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Run Code                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>rf", "<cmd>RunCode<CR>", description = "Run File" },
    { "<leader>rs", "<cmd>SnipRun<CR>", description = "Run Snip" },
    { "<leader>rc", "<cmd>SnipClose<CR>", description = "Close Snip" },

    -- Session
    -- { "<leader>ss", "<cmd>SaveSession<CR>", description = "Save session" },
    -- { "<leader>sr", "<cmd>RestoreSession<CR>", description = "Restore session" },
    -- { "<leader>sd", "<cmd>DeleteSession<CR>", description = "Delete session" },
    -- { "<leader>sl", "<cmd>lua require('session-lens').search_session()<CR>", description = "Search session" },

    -- Packer
    { "<leader>pc", "<cmd>PackerCompile<CR>", description = "Packer Compile" },
    { "<leader>pi", "<cmd>PackerInstall<CR>", description = "Packer Install" },
    { "<leader>ps", "<cmd>PackerSync<CR>", description = "Packer Sync" },
    { "<leader>pS", "<cmd>PackerStatus<CR>", description = "Packer Status" },
    { "<leader>pu", "<cmd>PackerUpdate<CR>", description = "Packer Update" },

    -- Terminal
    {
      "<leader>tr",
      "<cmd>FloatermNew --height=0.9 --width=0.9 --wintype=float ranger<CR>",
      description = "Ranger",
    },

    -- Buffers
    { "gp", "<cmd>BufferPick<CR>", description = "Buffer Picking" },
    { "gc", "<cmd>BufferLinePickClose<CR>", "Close Buffer" },
    { "g1", "<cmd>BufferGoto 1<CR>", description = "Go to Buffer 1" },
    { "g2", "<cmd>BufferGoto 2<CR>", description = "Go to Buffer 2" },
    { "g3", "<cmd>BufferGoto 3<CR>", description = "Go to Buffer 3" },
    { "g4", "<cmd>BufferGoto 4<CR>", description = "Go to Buffer 4" },
    { "g5", "<cmd>BufferGoto 5<CR>", description = "Go to Buffer 5" },
    { "g6", "<cmd>BufferGoto 6<CR>", description = "Go to Buffer 6" },
    { "g7", "<cmd>BufferGoto 7<CR>", description = "Go to Buffer 7" },
    { "g8", "<cmd>BufferGoto 8<CR>", description = "Go to Buffer 8" },
    { "g9", "<cmd>BufferGoto 9<CR>", description = "Go to Buffer 9" },
    { "g0", "<cmd>BufferLast<CR>", description = "Go to Buffer 10" },

    -- Test
    { "<leader>gt", "<cmd>TestNearest<CR>", description = "Test Nearest" },
    { "<leader>gT", "<cmd>TestFile<CR>", description = "Test File" },
    { "<leader>ga", "<cmd>TestSuite<CR>", description = "Test Suite" },
    { "<leader>gl", "<cmd>TestLast<CR>", description = "Test Last" },
    { "<leader>gg", "<cmd>TestVisit<CR>", description = "Test Visit" },

    -- Harpoon
    { "gh<C-n>", "<cmd>lua require('harpoon.ui').nav_next()<CR>", description = "Navigates to Next Mark" },
    { "gh<C-p>", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", description = "Navigates to Previous Mark" },
    { "gha", "<cmd>lua require('harpoon.mark').add_file()<CR>", description = "Mark File" },
    { "ghm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", description = "View All Project Marks" },
    { "gh1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", description = "Navigate to File 1" },
    { "gh2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", description = "Navigate to File 2" },
    { "gh3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", description = "Navigate to File 3" },
    { "gh4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", description = "Navigate to File 4" },
    { "gh5", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", description = "Navigate to File 5" },

    -- Trouble
    { "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", "Document Diagnostics" },
    { "<leader>xD", "<cmd>Trouble workspace_diagnostics<CR>", "Workspace Diagnostics" },
    -- using nvim-bqf
    { "<leader>xq", "<cmd>copen<CR>", "Quickfix" },
    { "<leader>xl", "<cmd>Trouble loclist<CR>", "Location List" },

    -- Miscellaneous
    { "<leader>mi", "<cmd>LspInfo<CR>", description = "LSP Info" },
    { "<leader>mI", "<cmd>Mason<CR>", description = "LSP Install Info" },
    { "<leader>ms", "<cmd>lua require('spectre').open_file_search()<CR>", description = "Spectre" },
    { "<leader>mu", "<cmd>UndotreeToggle<CR>", description = "Toggle Undotree" },
    { "<leader>ma", "<cmd>ASToggle<CR>", description = "Toggle AutoSave" },
    { "<leader>mp", "<cmd>PasteImg<CR>", description = "Paste Image" },
    { "<leader>mS", "<cmd>SymbolsOutline<CR>", description = "Symbols Outline" },
  },
})
