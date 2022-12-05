local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
  print("legendary failing")
end

legendary.setup({
  keymaps = {
    -- map keys to a command
    { "<C-t>", "<cmd>NvimTreeToggle<cr>", description = "Toggle Tree" },
    {
      itemgroup = "telescope",
      description = "Telescope",
      icon = "",
      keymaps = {
        { "<C-g>", "<cmd>Telescope find_files<cr>", description = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", description = "Find Text" },
        {
          "<leader>ff",
          "<cmd>Telescope current_buffer_fuzzy_find case_mode=ignore_case<cr>",
          description = "Find Text in Buffers",
        },
        { "<leader>fF", "<cmd>Telescope frecency<cr>", description = "Find Frecency" },
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>", description = "Open Recent File" },
        { "<leader>fp", "<cmd>Telescope projects<cr>", description = "Find Projects" },
        { "<leader>fr", "<cmd>Telescope neoclip<cr>", description = "Find Clipboard History" },
        { "<leader>ft", "<cmd>Telescope telescope-tabs list_tabs<cr>", description = "Find Tabs" },
      },
    },
    {
      itemgroup = "git",
      description = "Git",
      icon = "",
      keymaps = {
        { "leader>gd", "<cmd>DiffviewOpen<cr>", description = "git fiff index" },
        { "leader>gf", "<cmd>DiffviewFileHistory<cr>", description = "git FileHistory" },
        { "leader>gs", "<cmd>Telescope git_status<cr>", description = "git Status" },
        { "leader>gc", "<cmd>Telescope git_commits<cr>", description = "git Commits" },
      },
    },
    {
      itemgroup = "runcode",
      description = "Run Code",
      icon = "",
      keymaps = {
        { "<leader>rf", "<cmd>RunCode<cr>", description = "Run File" },
        { "<leader>rs", "<cmd>SnipRun<cr>", description = "Run Snip" },
        { "<leader>rc", "<cmd>SnipClose<cr>", description = "Close Snip" },
      },
    },
    {
      itemgroup = "sessionlen",
      description = "Session Len",
      icon = "",
      keymaps = {
        { "<leader>ss", "<cmd>SaveSession<cr>", description = "Save session" },
        { "<leader>sr", "<cmd>RestoreSession<cr>", description = "Restore session" },
        { "<leader>sd", "<cmd>DeleteSession<cr>", description = "Delete session" },
        { "<leader>sl", "<cmd>lua require('session-lens').search_session()<cr>", description = "Search session" },
      },
    },
    {
      itemgroup = "packer",
      description = "Packer",
      icon = "",
      keymaps = {
        { "<leader>pc", "<cmd>PackerCompile<cr>", description = "Packer Compile" },
        { "<leader>pi", "<cmd>PackerInstall<cr>", description = "Packer Install" },
        { "<leader>ps", "<cmd>PackerSync<cr>", description = "Packer Sync" },
        { "<leader>pS", "<cmd>PackerStatus<cr>", description = "Packer Status" },
        { "<leader>pu", "<cmd>PackerUpdate<cr>", description = "Packer Update" },
      },
    },
    {
      itemgroup = "terminal",
      description = "Terminal",
      icon = "",
      keymaps = {
        {
          "<leadeh>tr",
          "<cmd>FloatermNew --height=0.9 --width=0.9 --wintype=float ranger<cr>",
          description = "Ranger",
        },
      },
    },
    {
      itemgroup = "Buffer",
      description = "Buffer",
      icon = "",
      keymaps = {
        { "<C-g>", "<cmd>Telescope find_files<cr>", description = "Find files" },
        { "gp", "<cmd>BufferPick<cr>", description = "Buffer Picking" },
        { "gc", "<cmd>BufferLinePickClose<cr>", "Close Buffer" },
        { "g1", "<cmd>BufferGoto 1<cr>", description = "Go to Buffer 1" },
        { "g2", "<cmd>BufferGoto 2<cr>", description = "Go to Buffer 2" },
        { "g3", "<cmd>BufferGoto 3<cr>", description = "Go to Buffer 3" },
        { "g4", "<cmd>BufferGoto 4<cr>", description = "Go to Buffer 4" },
        { "g5", "<cmd>BufferGoto 5<cr>", description = "Go to Buffer 5" },
        { "g6", "<cmd>BufferGoto 6<cr>", description = "Go to Buffer 6" },
        { "g7", "<cmd>BufferGoto 7<cr>", description = "Go to Buffer 7" },
        { "g8", "<cmd>BufferGoto 8<cr>", description = "Go to Buffer 8" },
        { "g9", "<cmd>BufferGoto 9<cr>", description = "Go to Buffer 9" },
        { "g0", "<cmd>BufferLast<cr>", description = "Go to Buffer 10" },
      },
    },

    {
      itemgroup = "test",
      description = "Test",
      icon = "",
      keymaps = {
        { "<leader>gt", "<cmd>TestNearest<cr>", description = "Test Nearest" },
        { "<leader>gT", "<cmd>TestFile<cr>", description = "Test File" },
        { "<leader>ga", "<cmd>TestSuite<cr>", description = "Test Suite" },
        { "<leader>gl", "<cmd>TestLast<cr>", description = "Test Last" },
        { "<leader>gg", "<cmd>TestVisit<cr>", description = "Test Visit" },
      },
    },
    {
      itemgroup = "harpoon",
      description = "Harpoon",
      icon = "",
      keymaps = {
        { "h<C-n>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", description = "navigates to next mark" },
        { "h<C-p>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", description = "navigates to previous mark" },
        { "ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", description = "mark file" },
        { "hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", description = "view all project marks" },
        { "h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", description = "navigates to file 1" },
        { "h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", description = "navigates to file 2" },
        { "h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", description = "navigates to file 3" },
        { "h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", description = "navigates to file 4" },
        { "h5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", description = "navigates to file 5" },
      },
    },
    {
      itemgroup = "trouble",
      description = "Trouble",
      icon = "",
      keymaps = {
        { "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
        { "<leader>xD", "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
        -- using nvim-bqf
        { "<leader>xq", "<cmd>copen<cr>", "Quickfix" },
        { "<leader>xl", "<cmd>Trouble loclist<cr>", "Location List" },
      },
    },
    {
      itemgroup = "miscellaneous",
      description = "Miscellaneous",
      icon = "",
      keymaps = {
        { "<leader>mi", "<cmd>LspInfo<cr>", description = "LspInfo" },
        { "<leader>mI", "<cmd>Mason<cr>", description = "LspInstallInfo" },
        { "<leader>ms", "<cmd>lua require('spectre').open_file_search()<CR>", description = "Spectre" },
        { "<leader>mu", "<cmd>UndotreeToggle<cr>", description = "Toggle Undotree" },
        { "<leader>ma", "<cmd>ASToggle<cr>", description = "Toggle AutoSave" },
        { "<leader>mp", "<cmd>PasteImg<cr>", description = "Paste Image" },
        { "<leader>mS", "<cmd>SymbolsOutline<cr>", description = "SymbolsOutline" },
      },
    },
  },
})
