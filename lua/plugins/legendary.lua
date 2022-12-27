local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
  print("legendary failing")
end

local toolbox = require("legendary.toolbox")

function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})
  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

function vim.close_all_but_current_buffer()
  for _, e in ipairs(require("bufferline").get_elements().elements) do
    vim.schedule(function()
      if e.id == vim.api.nvim_get_current_buf() then
        return
      else
        vim.cmd("bd " .. e.id)
      end
    end)
  end
end

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
    {
      "<C-g>",
      "<cmd>lua require('telescope.builtin').git_files({ cwd = require'telescope.utils'.buffer_dir() })<CR>",
      description = "Telescope: Find Files",
    },
    { "<C-l>", "<cmd>Legendary<CR>", description = "Legendary", mode = { "n", "i", "x" } },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Telescope                                                │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<leader>ff",
      "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
      description = "Telescope: Find Text in Current Buffer",
    },
    {
      "<leader>ff",
      function()
        local text = vim.getVisualSelection()
        require("telescope.builtin").current_buffer_fuzzy_find({ default_text = text })
      end,
      description = "Telescope: Find Text in Current Buffer",
      mode = { "v" },
    },
    {
      "<leader>fg",
      "<cmd>lua require('telescope.builtin').live_grep()<CR>",
      description = "Telescope: Find Text",
    },
    {
      "<leader>fg",
      function()
        local text = vim.getVisualSelection()
        require("telescope.builtin").live_grep({ default_text = text })
      end,
      description = "Telescope: Find Text",
      mode = { "v" },
    },
    -- { "<leader>fF", "<cmd>Telescope frecency<CR>", description = "Telescope: Find Frecency" },
    { "<leader>fx", "<cmd>Telescope find_files<CR>", description = "Telescope: Find File" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>", description = "Telescope: Open Recent File" },
    { "<leader>fp", "<cmd>Telescope projects<CR>", description = "Telescope: Find Projects" },
    { "<leader>fb", "<cmd>Telescope file_browser<CR>", description = "Telescope: File Browser" },
    { "<leader>fr", "<cmd>Telescope neoclip<CR>", description = "Telescope: Clipboard History" },
    { "<leader>ft", "<cmd>Telescope buffers<CR>", description = "Telescope: Buffers" },
    { "<leader>fj", "<cmd>Telescope jumplist<CR>", description = "Telescope: Jumplist" },
    { "<leader>fc", "<cmd>lua require('fzf-lua').changes()<CR>", description = "Telescope: Changes" },

    { "<leader>fXc", "<cmd>Telescope command_history<CR>", description = "Telescope: Command History" },
    { "<leader>fXs", "<cmd>Telescope search_history<CR>", description = "Telescope: Search History" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ LSP                                                      │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>", description = "LSP: Finder: Symbol, Definition and Implementation" },
    { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", description = "LSP: Line Diagnostics" },

    {
      "gd",
      toolbox.lazy_required_fn("goto-preview", "goto_preview_definition"),
      description = "LSP: Preview Definition",
    },
    -- { "gd", "<cmd>Lspsaga peek_definition<CR>", description = "LSP: Preview Definition" },
    { "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", description = "LSP: Go to Definition" },

    {
      "gt",
      toolbox.lazy_required_fn("goto-preview", "goto_preview_type_definition"),
      description = "LSP: Preview Type Definition",
    },
    { "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", description = "LSP: Go to Type Definition" },

    { "gr", "<cmd>Telescope lsp_references<CR>", description = "LSP: Reference List" },
    { "gR", "<cmd>Trouble lsp_references<CR>", description = "LSP: Reference List" },
    -- {
    --   "gr",
    --   toolbox.lazy_required_fn("goto-preview", "goto_preview_references"),
    --   description = "LSP: Reference List",
    -- },

    { "<leader>lq", "<cmd>copen<CR>", description = "LSP: Quickfix List" }, -- using nvim-bqf
    { "<leader>lr", "<cmd>Lspsaga rename<CR>", description = "LSP: Rename" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", description = "LSP: Signature Help" },
    -- { "<leader>lc", "<cmd>lua vim.lsp.buf.code_action()<CR>", description = "LSP: Code Action" },
    { "<leader>lc", "<cmd>Lspsaga code_action<CR>", description = "LSP: Code Action" },

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
    { "<leader>lXc", "<cmd>lua vim.lsp.codelens.run()<CR>", description = "LSP: Code Lens" },
    { "<leader>lXd", "<cmd>lua vim.lsp.buf.declaration<CR>", description = "LSP: Declaration" },
    { "<leader>lXf", "<cmd>lua vim.lsp.buf.format()<CR>", description = "LSP: Formatting" },
    { "<leader>lXl", "<cmd>TroubleToggle loclist<CR>", description = "LSP: Location List" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ bufferline                                               │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<A-,>", "<cmd>BufferLineCyclePrev<CR>", description = "Buffer: Move to Previous" },
    { "<A-.>", "<cmd>BufferLineCycleNext<CR>", description = "Buffer: Move to Next" },
    { "<A-<>", "<cmd>BufferLineMovePrev<CR>", description = "Buffer: Re-order to Previous" },
    { "<A->>", "<cmd>BufferLineMoveNext<CR>", description = "Buffer: Re-order to Next" },
    { "<A-c>", "<cmd>Bdelete<CR>", description = "Buffer: Close" },
    { "g1", "<cmd>BufferLineGoToBuffer 1<CR>", description = "Go to Buffer 1" },
    { "g2", "<cmd>BufferLineGoToBuffer 2<CR>", description = "Go to Buffer 2" },
    { "g3", "<cmd>BufferLineGoToBuffer 3<CR>", description = "Go to Buffer 3" },
    { "g4", "<cmd>BufferLineGoToBuffer 4<CR>", description = "Go to Buffer 4" },
    {
      "<A-X>c",
      function()
        vim.close_all_but_current_buffer()
      end,
      description = "Buffer: Close All But Current",
    },
    { "g5", "<cmd>BufferLineGoToBuffer 5<CR>", description = "Go to Buffer 5" },
    { "g6", "<cmd>BufferLineGoToBuffer 6<CR>", description = "Go to Buffer 6" },
    { "g7", "<cmd>BufferLineGoToBuffer 7<CR>", description = "Go to Buffer 7" },
    { "g8", "<cmd>BufferLineGoToBuffer 8<CR>", description = "Go to Buffer 8" },
    { "g9", "<cmd>BufferLineGoToBuffer 9<CR>", description = "Go to Buffer 9" },
    { "g0", "<cmd>BufferLineGoToBuffer -1<CR>", description = "Go to Buffer 10" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ barbar.lua                                               │
    -- ╰──────────────────────────────────────────────────────────╯
    -- { "<A-,>", "<cmd>BufferPrevious<CR>", description = "Buffer: Move to Previous" },
    -- { "<A-.>", "<cmd>BufferNext<CR>", description = "Buffer: Move to Next" },
    -- { "<A-<>", "<cmd>BufferMovePrevious<CR>", description = "Buffer: Re-order to Previous" },
    -- { "<A->>", "<cmd>BufferMoveNext<CR>", description = "Buffer: Re-order to Next" },
    -- { "<A-c>", "<cmd>BufferClose<CR>", description = "Buffer: Close" },
    -- { "<A-X>c", "<cmd>BufferCloseAllButCurrentOrPinned<CR>", description = "Buffer: Close All But Current Or Pinned" },
    -- { "<A-X>P", "<cmd>BufferPin<CR>", description = "Buffer: Toggle Pin" },
    -- { "g1", "<cmd>BufferGoto 1<CR>", description = "Go to Buffer 1" },
    -- { "g2", "<cmd>BufferGoto 2<CR>", description = "Go to Buffer 2" },
    -- { "g3", "<cmd>BufferGoto 3<CR>", description = "Go to Buffer 3" },
    -- { "g4", "<cmd>BufferGoto 4<CR>", description = "Go to Buffer 4" },
    -- { "g5", "<cmd>BufferGoto 5<CR>", description = "Go to Buffer 5" },
    -- { "g6", "<cmd>BufferGoto 6<CR>", description = "Go to Buffer 6" },
    -- { "g7", "<cmd>BufferGoto 7<CR>", description = "Go to Buffer 7" },
    -- { "g8", "<cmd>BufferGoto 8<CR>", description = "Go to Buffer 8" },
    -- { "g9", "<cmd>BufferGoto 9<CR>", description = "Go to Buffer 9" },
    -- { "g0", "<cmd>BufferLast<CR>", description = "Go to Buffer 10" },

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
    { "<leader>gl", "<cmd>LazyGit<CR>", description = "git: lazygit" },
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
    { "<leader>tr", "<cmd>Ranger<CR>", description = "Terminal: Ranger" },
    -- { "<leader>tn", "<cmd>ToggleTerm<CR>", description = "Terminal: New" },

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
      {
        n = "<cmd>write | edit | lua vim.lsp.buf.format()<CR> | TSBufEnable highlight<CR>zz",
        i = "<c-o><cmd>write | edit | lua vim.lsp.buf.format()<CR> | TSBufEnable highlight<CR>zz",
      },
      description = "Save Buffer",
    },
    { "<C-w>o", "<cmd>NeoZoomToggle<CR>", description = "Misc: NeoZoom: Toggle" },

    { "<A-p>", "<cmd>cprev<CR>zz", description = "Previous Quickfix Item" },
    { "<A-n>", "<cmd>cnext<CR>zz", description = "Next Quickfix Item" },

    -- TODO the following are available:
    -- gp and gn
    -- J and K
    { "<C-j>", "g,zz", description = "Next Change list Item" },
    { "<C-k>", "g;zz", description = "Previous Change list Item" },
    { "<C-o>", "<C-o>zz", description = "Previous Jumplist Item" },
    { "<C-i>", "<C-i>zz", description = "Next Jumplist Item" },
    { "<C-f>", '<C-R>"', description = "Paste Last Yanked / Deleted", mode = { "i" } },
    { "<C-v>", "<C-R>*", description = "Paste Clipboard Content", mode = { "i" } },
    { "<A-o>", toolbox.lazy_required_fn("portal", "jump_backward"), description = "Portal: Backward" },
    { "<A-i>", toolbox.lazy_required_fn("portal", "jump_forward"), description = "Portal: Foward" },

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
    { "<leader>Mxxse", "<cmd>ScrollViewEnable<CR>", description = "Misc: ScrollView: Enable" },
    { "<leader>Mxxsd", "<cmd>ScrollViewDisable<CR>", description = "Misc: ScrollView: Disable" },
    -- { "<leader>mp", "<cmd>PasteImg<CR>", description = "Misc: Paste Image" },
    { "<leader>Mo", "<cmd>LSoutlineToggle<CR>", description = "Misc: Symbols Outline" },
    { "<leader>MS", "<cmd>SymbolsOutline<CR>", description = "Misc: Symbols Outline" },
    { "<leader>MTQ", "<cmd>TodoQuickFix<CR>", description = "Misc: Todo QuickFix" },
    { "<leader>MTT", "<cmd>TodoTelescope<CR>", description = "Misc: Todo Telescope" },
    {
      "<leader>Ms",
      toolbox.lazy_required_fn("spectre", "open_file_search"),
      description = "Misc: Spectre: Search Current File",
    },
    {
      "<leader>Mb",
      "<cmd>lua require('comment-box').lbox()<CR><Esc>",
      description = "Left-aligned Comment Box",
      mode = { "x" },
    },
    {
      "<leader>Mc",
      "<cmd>n ~/.config/nvim/lua/packer_init.lua ~/.config/nvim/init.lua<CR>",
      description = "Misc: Edit Config",
    },
  },
})
