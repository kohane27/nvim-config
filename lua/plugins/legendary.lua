local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
  print("legendary failing")
end

local toolbox = require("legendary.toolbox")

legendary.setup({
  include_builtin = false,
  sort = {
    -- this takes precedence over other sort options
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
    { "<leader>fd", "<cmd>Telescope diagnostics<CR>", description = "Telescope: Find Diagnostics" },
    -- { "<leader>fF", "<cmd>Telescope frecency<CR>", description = "Telescope: Find Frecency" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>", description = "Telescope: Open Recent File" },
    { "<leader>fp", "<cmd>Telescope projects<CR>", description = "Telescope: Find Projects" },
    { "<leader>fb", "<cmd>Telescope file_browser<CR>", description = "Telescope: File Browser" },
    { "<leader>fr", "<cmd>Telescope neoclip<CR>", description = "Telescope: Find Clipboard History" },
    { "<leader>ft", "<cmd>Telescope telescope-tabs list_tabs<CR>", description = "Telescope: Find Tabs" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ LSP                                                      │
    -- ╰──────────────────────────────────────────────────────────╯
    { "gh", "<cmd>Lspsaga lsp_finder<CR>", description = "LSP: Finder: Symbol Definition Implementation" },
    { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", description = "LSP: Line Diagnostics" },

    { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", description = "LSP: Go to Definition" },
    -- { "gD", "<cmd>Lspsaga peek_definition<CR>", description = "LSP: Preview Definition" },
    {
      "gD",
      toolbox.lazy_required_fn("goto-preview", "goto_preview_definition"),
      description = "LSP: Preview Definition",
    },

    { "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", description = "LSP: Go to Type Definition" },
    {
      "gT",
      toolbox.lazy_required_fn("goto-preview", "goto_preview_type_definition"),
      description = "LSP: Preview Type Definition",
    },

    { "gr", "<cmd>Telescope lsp_references<CR>", description = "LSP: Reference List" },
    { "gR", "<cmd>Trouble lsp_references<CR>", description = "LSP: Reference List" },
    -- {
    --   "gr",
    --   toolbox.lazy_required_fn("goto-preview", "goto_preview_references"),
    --   description = "LSP: Reference List",
    -- },

    { "<leader>lrn", "<cmd>Lspsaga rename<CR>", description = "LSP: Rename" },

    { "<leader>lca", "<cmd>lua vim.lsp.buf.code_action()<CR>", description = "LSP: Code Action" },
    -- { "<leader>lca", "<cmd>Lspsaga code_action<CR>", description = "LSP: Code Action" },

    { "<leader>lcl", "<cmd>lua vim.lsp.codelens.run()<CR>", description = "LSP: Code Lens" },
    { "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", description = "LSP: Hover Doc" },
    { "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", description = "LSP: Go to Previous Diagnostic" },
    {
      "[D",
      "<cmd>lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>",
      description = "LSP: Go to Previous Error",
    },
    { "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", description = "LSP: Go to Next Diagnostic" },
    {
      "]D",
      "<cmd>lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>",
      description = "LSP: Go to Next Error",
    },

    { "<leader>ld", "<cmd>TroubleToggle document_diagnostics<CR>", description = "LSP: Document Diagnostics" },
    { "<leader>lD", "<cmd>TroubleToggle workspace_diagnostics<CR>", description = "LSP: Workspace Diagnostics" },

    -- lesser used
    -- implementation (rarely)
    -- { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", description = "LSP: Go to Implementation" },
    {
      "gI",
      toolbox.lazy_required_fn("goto-preview", "goto_preview_implementation"),
      description = "LSP: Preview Implementation",
    },
    { "<leader>lX", "<cmd>lua vim.lsp.buf.declaration<CR>", description = "LSP: Declaration" },
    { "<leader>lF", "<cmd>lua vim.lsp.buf.format()<CR>", description = "LSP: Formatting" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", description = "LSP: Signature Help" },

    -- using nvim-bqf
    { "<leader>lq", "<cmd>copen<CR>", description = "LSP: Quickfix List" },
    { "<leader>ll", "<cmd>TroubleToggle loclist<CR>", description = "LSP: Location List" },

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
    -- │   Miscellaneous Keymaps                                  │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<c-s>",
      -- https://github.com/nvim-treesitter/nvim-treesitter#i-experience-weird-highlighting-issues-similar-to-78
      { n = "<cmd>write | edit | TSBufEnable highlight<CR>zz", i = "<c-o>:w<CR>" },
      description = "Save Buffer",
    },
    { "<C-w>o", "<cmd>NeoZoomToggle<CR>", description = "Toggle NeoZoom" },

    { "<A-p>", "<cmd>cprev<CR>zz", description = "Previous Quickfix Item" },
    { "<A-n>", "<cmd>cnext<CR>zz", description = "Next Quickfix Item" },

    -- TODO A-o and A-i available
    -- TODO rethink C-j and C-k
    { "<C-j>", "g,zz", description = "Next Changelist Item" },
    { "<C-k>", "g;zz", description = "Previous Changelist Item" },
    { "<C-f>", '<C-R>"', description = "Paste Last Yanked / Deleted", mode = { "i" } },
    { "<C-v>", "<C-R>*", description = "Paste Clipboard Content", mode = { "i" } },
    -- { "<C-o>", toolbox.lazy_required_fn("portal", "jump_backward"), description = "Portal Backward" },
    -- { "<C-i>", toolbox.lazy_required_fn("portal", "jump_forward"), description = "Portal Foward" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │   Miscellaneous (leader M)                               │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>Mpc", "<cmd>PackerCompile<CR>", description = "Misc: Packer: Compile" },
    { "<leader>Mpi", "<cmd>PackerInstall<CR>", description = "Misc: Packer: Install" },
    { "<leader>Mps", "<cmd>PackerSync<CR>", description = "Misc: Packer: Sync" },
    { "<leader>MpS", "<cmd>PackerStatus<CR>", description = "Misc: Packer: Status" },
    { "<leader>Mpu", "<cmd>PackerUpdate<CR>", description = "Misc: Packer: Update" },

    { "<leader>Mi", "<cmd>LspInfo<CR>", description = "Misc: LSP: Info" },
    { "<leader>MI", "<cmd>Mason<CR>", description = "Misc: LSP: Install Info" },

    { "<leader>Mu", "<cmd>UndotreeToggle<CR>", description = "Misc: Undotree: Toggle" },
    { "<leader>Ma", "<cmd>ASToggle<CR>", description = "Misc: AutoSave: Toggle" },
    -- { "<leader>mp", "<cmd>PasteImg<CR>", description = "Misc: Paste Image" },
    { "<leader>Mo", "<cmd>LSoutlineToggle<CR>", description = "Misc: Symbols Outline" },
    { "<leader>MS", "<cmd>SymbolsOutline<CR>", description = "Misc: Symbols Outline" },
    {
      "<leader>Ms",
      toolbox.lazy_required_fn("spectre", "open_file_search"),
      description = "Misc: Spectre: File Search",
    },
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
