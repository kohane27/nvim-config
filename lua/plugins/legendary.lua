local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
  print("legendary failing")
end

local toolbox = require("legendary.toolbox")
-- local keymaps = {
--   { "<leader>f", toolbox.lazy_required_fn("telescope.builtin", "oldfiles", { only_cwd = true }) },
--   -- you can use a dot in the 2nd parameter to access functions nested in tables
--   { "<leader>tt", toolbox.lazy_required_fn("neotest", "run.run") },
-- }

legendary.setup({
  include_builtin = false,
  sort = {
    -- this takes precedence over other sort options!
    frecency = {
      db_root = string.format("%s/legendary/", vim.fn.stdpath("data")),
      max_timestamps = 20,
    },
  },
  keymaps = {
    -- <C-KEY>
    { "<C-t>", "<cmd>NvimTreeToggle<CR>", description = "Tree: Toggle" },
    { "<C-g>", "<cmd>Telescope find_files<CR>", description = "Telescope: Find Files" },
    { "<C-l>", "<cmd>Legendary<CR>", description = "Legendary", mode = { "n", "i" } },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Telescope                                                │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", description = "Telescope: Find Text" },
    {
      "<leader>ff",
      "<cmd>Telescope current_buffer_fuzzy_find case_mode=ignore_case<CR>",
      description = "Telescope: Find Text in Buffers",
    },
    -- { "<leader>fF", "<cmd>Telescope frecency<CR>", description = "Telescope: Find Frecency" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>", description = "Telescope: Open Recent File" },
    { "<leader>fp", "<cmd>Telescope projects<CR>", description = "Telescope: Find Projects" },
    { "<leader>fb", "<cmd>Telescope file_browser<CR>", description = "Telescope: File Browser" },
    { "<leader>fr", "<cmd>Telescope neoclip<CR>", description = "Telescope: Find Clipboard History" },
    { "<leader>ft", "<cmd>Telescope telescope-tabs list_tabs<CR>", description = "Telescope: Find Tabs" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ LSP                                                      │
    -- ╰──────────────────────────────────────────────────────────╯
    { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", description = "LSP: Go to Definition" },
    {
      "gD",
      toolbox.lazy_required_fn("goto-preview", "goto_preview_definition"),
      description = "LSP: Preview Definition",
    },

    -- {"gD", "<cmd>Lspsaga peek_definition<CR>", description = "Preview Definition"},

    { "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", description = "LSP: Go to Type Definition" },
    {
      "<leader>lT",
      toolbox.lazy_required_fn("goto-preview", "goto_preview_type_definition"),
      description = "LSP: Preview Type Definition",
    },

    -- implementation (rarely)
    { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", description = "LSP: Go to Implementation" },
    {
      "<leader>lI",
      toolbox.lazy_required_fn("goto-preview", "goto_preview_implementation"),
      description = "LSP: Preview Implementation",
    },
    { "<leader>la", "<cmd>Lspsaga code_action<CR>", description = "LSP: Code Action" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", description = "LSP: Code Lens" },
    { "<leader>lr", "<cmd>Trouble lsp_references<CR>", description = "LSP: Reference List" },
    {
      "<leader>lR",
      toolbox.lazy_required_fn("goto-preview", "goto_preview_references"),
      description = "LSP: Preview Reference List",
    },

    { "<leader>ln", "<cmd>Lspsaga rename<CR>", description = "LSP: Rename" },
    { "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", description = "LSP: Hover Doc" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", description = "LSP: Formatting" },
    { "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", description = "LSP: Go to Previous Diagnostic" },
    { "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", description = "LSP: Go to Next Diagnostic" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ barbar.lua                                               │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<A-,>", "<cmd>BufferPrevious<CR>", description = "Buffer: Move to Previous" },
    { "<A-.>", "<cmd>BufferNext<CR>", description = "Buffer: Move to Next" },
    { "<A-<>", "<cmd>BufferMovePrevious<CR>", description = "Buffer: Re-order to Previous" },
    { "<A->>", "<cmd>BufferMoveNext<CR>", description = "Buffer: Re-order to Next" },
    { "<A-c>", "<cmd>BufferClose<CR>", description = "Buffer: Close" },
    -- {"<A-c>", "<cmd>BufferCloseAllButCurrent<CR>", description = "Buffer: Close All But Current"},
    -- {"<A-p>", "<cmd>BufferPin<CR>", description = "Buffer: Toggle Pin"},
    -- {"<A-C>", "<cmd>BufferCloseAllButPinned<CR>", description = "Buffer: Close All But Pinned"},
    -- {"<A-C>", "<cmd>BufferCloseAllButCurrentOrPinned<CR>", description = "Buffer: Close All But Current Or Pinned"},
    { "gp", "<cmd>BufferPick<CR>", description = "Buffer: Picking" },
    { "gc", "<cmd>BufferLinePickClose<CR>", "Buffer: Close" },
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

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ substitute.lua                                           │
    -- ╰──────────────────────────────────────────────────────────╯
    { "cx", toolbox.lazy_required_fn("substitute.exchange", "operator"), description = "Substitute Exchange Operator" },
    { "cxx", toolbox.lazy_required_fn("substitute.exchange", "line"), description = "Substitute Exchange Line" },
    -- map("x", "cx", toolbox.lazy_required_fn("substitute.exchange", "visual"), description = "Substitute Exchange Line"},
    { "cxc", toolbox.lazy_required_fn("substitute.exchange", "cancel"), description = "Substitute Exchange Cancel" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ tmux.lua                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<A-h>", toolbox.lazy_required_fn("tmux", "move_left"), description = "Move Focus to Left" },
    { "<A-l>", toolbox.lazy_required_fn("tmux", "move_right"), description = "Move Focus to Right" },
    { "<A-k>", toolbox.lazy_required_fn("tmux", "move_top"), description = "Move Focus to Top" },
    { "<A-j>", toolbox.lazy_required_fn("tmux", "move_bottom"), description = "Move Focus to Bottom" },
    { "<C-Left>", toolbox.lazy_required_fn("tmux", "resize_left"), description = "Resize Left" },
    { "<C-Right>", toolbox.lazy_required_fn("tmux", "resize_right"), description = "Resize Right" },
    { "<C-Up>", toolbox.lazy_required_fn("tmux", "resize_top"), description = "Resize Top" },
    { "<C-Down>", toolbox.lazy_required_fn("tmux", "resize_bottom"), description = "Resize Bottom" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Git                                                      │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<leader>gl",
      "<cmd>FloatermNew --height=1.0 --width=1.0 --wintype=float lazygit<CR>",
      description = "git: lazygit",
    },
    { "<leader>gd", "<cmd>DiffviewOpen<CR>", description = "git: diff index" },
    { "<leader>gf", "<cmd>DiffviewFileHistory<CR>", description = "git: File History" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", description = "git: Status" },
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", description = "git: Commits" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Run Code                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>rf", "<cmd>RunCode<CR>", description = "Run File" },
    { "<leader>rs", "<cmd>SnipRun<CR>", description = "Run Snip" },
    { "<leader>rc", "<cmd>SnipClose<CR>", description = "Close Snip" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Packer                                                   │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>pc", "<cmd>PackerCompile<CR>", description = "Packer: Compile" },
    { "<leader>pi", "<cmd>PackerInstall<CR>", description = "Packer: Install" },
    { "<leader>ps", "<cmd>PackerSync<CR>", description = "Packer: Sync" },
    { "<leader>pS", "<cmd>PackerStatus<CR>", description = "Packer: Status" },
    { "<leader>pu", "<cmd>PackerUpdate<CR>", description = "Packer: Update" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Terminal                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<leader>tr",
      "<cmd>FloatermNew --height=0.9 --width=0.9 --wintype=float ranger<CR>",
      description = "Terminal: Ranger",
    },
    { "<leader>tn", "<cmd>ToggleTerm<CR>", description = "Terminal: New" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │  Grapple                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>mm", toolbox.lazy_required_fn("grapple", "popup_tags"), description = "Grapple: View All Tags" },
    { "<leader>mj", toolbox.lazy_required_fn("grapple", "cycle_forward"), description = "Grapple: Next Tag" },
    { "<leader>mk", toolbox.lazy_required_fn("grapple", "cycle_backward"), description = "Grapple: Previous Tag" },
    { "<leader>mn", toolbox.lazy_required_fn("grapple", "toggle"), description = "Grapple: Tag or Untag File" },
    { "<leader>m1", "<cmd>lua require('grapple').select({key = 1})<CR>", description = "Grapple: File 1" },
    { "<leader>m2", "<cmd>lua require('grapple').select({key = 2})<CR>", description = "Grapple: File 2" },
    { "<leader>m3", "<cmd>lua require('grapple').select({key = 3})<CR>", description = "Grapple: File 3" },
    { "<leader>m4", "<cmd>lua require('grapple').select({key = 4})<CR>", description = "Grapple: File 4" },
    { "<leader>m5", "<cmd>lua require('grapple').select({key = 5})<CR>", description = "Grapple: File 5" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Test                                                     │
    -- ╰──────────────────────────────────────────────────────────╯
    -- { "<leader>gt", "<cmd>TestNearest<CR>", description = "Test: Nearest" },
    -- { "<leader>gT", "<cmd>TestFile<CR>", description = "Test: File" },
    -- { "<leader>ga", "<cmd>TestSuite<CR>", description = "Test: Suite" },
    -- { "<leader>gl", "<cmd>TestLast<CR>", description = "Test: Last" },
    -- { "<leader>gg", "<cmd>TestVisit<CR>", description = "Test: Visit" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Session                                                  │
    -- ╰──────────────────────────────────────────────────────────╯
    -- { "<leader>ss", "<cmd>SaveSession<CR>", description = "Session: Save session" },
    -- { "<leader>sr", "<cmd>RestoreSession<CR>", description = "Session: Restore session" },
    -- { "<leader>sd", "<cmd>DeleteSession<CR>", description = "Session: Delete session" },
    -- { "<leader>sl", "<cmd>lua require('session-lens').search_session()<CR>", description = "Session: Search session" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │  Trouble                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", description = "Trouble: Document Diagnostics" },
    { "<leader>xD", "<cmd>Trouble workspace_diagnostics<CR>", description = "Trouble: Workspace Diagnostics" },
    -- using nvim-bqf
    { "<leader>xq", "<cmd>copen<CR>", description = "Trouble: Quickfix" },
    { "<leader>xl", "<cmd>Trouble loclist<CR>", description = "Trouble: Location List" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │   Miscellaneous Keymaps                                  │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<c-s>",
      -- https://github.com/nvim-treesitter/nvim-treesitter#i-experience-weird-highlighting-issues-similar-to-78
      { n = "<cmd>write | edit | TSBufEnable highlight<CR>zz", i = "<c-o>:w<CR>" },
      description = "Save Buffer",
    },
    { "<C-w>o", "<cmd>NeoZoomToggle<CR>", description = "Toggle NeoZoom" },

    { "<A-p>", "<cmd>cprev<cr>", description = "Previous Quickfix Item" },
    { "<A-n>", "<cmd>cnext<cr>", description = "Next Quickfix Item" },

    { "<A-o>", toolbox.lazy_required_fn("bufjump", "backward"), description = "Jump to Previous Buffer" },
    { "<A-i>", toolbox.lazy_required_fn("bufjump", "forward"), description = "Jump to Next Buffer" },

    -- TODO rethink C-j and C-k
    -- { "<C-j>", "g;", description = "Previous Changelist Item" },
    -- { "<C-k>", "g,", description = "Next Changelist Item" },
    { "<C-f>", '<C-R>"', description = "Paste Last Yanked / Deleted", mode = { "i" } },
    { "<C-v>", "<C-R>*", description = "Paste Clipboard Content", mode = { "i" } },
    { "<C-o>", toolbox.lazy_required_fn("portal", "jump_backward"), description = "Portal Backward" },
    { "<C-i>", toolbox.lazy_required_fn("portal", "jump_forward"), description = "Portal Foward" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │   Miscellaneous (leader M)                               │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>Mi", "<cmd>LspInfo<CR>", description = "Misc: LSP: Info" },
    { "<leader>MI", "<cmd>Mason<CR>", description = "Misc: LSP: Install Info" },
    { "<leader>Ms", "<cmd>lua require('spectre').open_file_search()<CR>", description = "Misc: Spectre: File Search" },
    { "<leader>Mu", "<cmd>UndotreeToggle<CR>", description = "Misc: Undotree: Toggle" },
    { "<leader>Ma", "<cmd>ASToggle<CR>", description = "Misc: AutoSave: Toggle" },
    -- { "<leader>mp", "<cmd>PasteImg<CR>", description = "Misc: Paste Image" },
    { "<leader>Mo", "<cmd>LSoutlineToggle<CR>", description = "Misc: Symbols Outline" },
    { "<leader>MS", "<cmd>SymbolsOutline<CR>", description = "Misc: Symbols Outline" },
    {
      "<leader>Mb",
      { v = toolbox.lazy_required_fn("comment-box", "lbox") },
      description = "Left-aligned Comment Box",
    },
    {
      "<leader>Mc",
      "<cmd>n ~/.config/nvim/lua/packer_init.lua ~/.config/nvim/init.lua<CR>",
      description = "Misc: Edit Config",
    },
  },
})
