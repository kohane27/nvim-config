local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- number of suggestions in the list
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["ESC>"] = "ESC",
    ["<bs>"] = "BSPC",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  ["<C-g>"] = { "<cmd>Telescope find_files<cr>", "Find files" },
  ["<C-t>"] = { "<cmd>NvimTreeToggle<cr>", "Tree" },
  ["<C-e>"] = { "<cmd>TerminatorOutputBufferToggle<cr>", "Toggle Terminator" },
  g = {
    name = "g",
    -- can't use gs and gS; taken by lightspeed

    -- buffer below
    p = { "<cmd>BufferPick<cr>", "Buffer Picking" },
    -- c = { "<cmd>BufferLinePickClose<cr>", "Close Buffer" },
    ["1"] = { "<cmd>BufferGoto 1<cr>", "Buffer 1" },
    ["2"] = { "<cmd>BufferGoto 2<cr>", "Buffer 2" },
    ["3"] = { "<cmd>BufferGoto 3<cr>", "Buffer 3" },
    ["4"] = { "<cmd>BufferGoto 4<cr>", "Buffer 4" },
    ["5"] = { "<cmd>BufferGoto 5<cr>", "Buffer 5" },
    ["6"] = { "<cmd>BufferGoto 6<cr>", "Buffer 6" },
    ["7"] = { "<cmd>BufferGoto 7<cr>", "Buffer 7" },
    ["8"] = { "<cmd>BufferGoto 8<cr>", "Buffer 8" },
    ["9"] = { "<cmd>BufferGoto 9<cr>", "Buffer 9" },
    ["0"] = { "<cmd>BufferLast<cr>", "Buffer 10" },

    -- h = {
    --   name = "Harpoon",
    --   ["<C-n>"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "navigates to next mark" },
    --   ["<C-p>"] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "navigates to previous mark" },
    --   a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "mark file" },
    --   m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "view all project marks" },
    --   ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "navigates to file 1" },
    --   ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "navigates to file 2" },
    --   ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "navigates to file 3" },
    --   ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "navigates to file 4" },
    --   ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "navigates to file 5" },
    -- },
    t = {
      name = "Test",
      t = { "<cmd>TestNearest<cr>", "Nearest" },
      T = { "<cmd>TestFile<cr>", "File" },
      a = { "<cmd>TestSuite<cr>", "Suite" },
      l = { "<cmd>TestLast<cr>", "Last" },
      g = { "<cmd>TestVisit<cr>", "Visit" },
    },
  },

  ["<leader>"] = {
    -- "<leader>n": g:VM_maps['Find Under']
    t = {
      name = "Terminal",
      -- n = { "toggleterm", "New" }, in `toggleterm`
      r = { "<cmd>FloatermNew --height=0.9 --width=0.9 --wintype=float ranger<cr>", "Ranger" },
    },
    f = {
      name = "Find",
      g = { "<cmd>Telescope live_grep<cr>", "Find text" },
      f = { "<cmd>Telescope current_buffer_fuzzy_find case_mode=ignore_case<cr>", "Buffers" },
      -- annoying msg
      -- F = { "<cmd>Telescope frecency<cr>", "Find frecency" },
      o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      p = { "<cmd>Telescope projects<cr>", "Projects" },

      -- g = { "<cmd>lua require('fzf-lua').live_grep_native()<cr>", "Find text" },
      -- b = { "<cmd>lua require('fzf-lua').lgrep_curbuf()<cr>", "Buffers" },
      -- w = { "<cmd>lua require('fzf-lua').grep_cword()<cr>", "word under cursor" },
      -- r = { "<cmd>lua require('fzf-lua').oldfiles()<cr>", "Open Recent File" },
    },
    x = {
      name = "Trouble",
      d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
      D = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
      -- using nvim-bqf
      q = { "<cmd>copen<cr>", "Quickfix" },
      l = { "<cmd>Trouble loclist<cr>", "Location List" },
    },
    g = {
      name = "Git",
      l = { "<cmd>FloatermNew --height=1.0 --width=1.0 --wintype=float lazygit<cr>", "lazygit" },
      d = { "<cmd>DiffviewOpen<cr>", "Diff index" },
      f = { "<cmd>DiffviewFileHistory<cr>", "FileHistory" },
      s = { "<cmd>Telescope git_status<cr>", "Status" },
      c = { "<cmd>Telescope git_commits<cr>", "Commits" },
    },
    r = {
      name = "Run Code",
      -- vnoremap <leader>rf :TerminatorRunPartOfFileInOutputBuffer<CR>
      f = { "<cmd>TerminatorRunFileInOutputBuffer<cr>", "Run File" },
      -- vnoremap <leader>rs :<Plug>SnipRun<CR>
      -- s = { "<cmd>SnipRun<cr>", "Run Snip" },
      -- c = { "<cmd>SnipClose<cr>", "Close Snip" },
    },
    m = {
      name = "Miscellaneous",
      i = { "<cmd>LspInfo<cr>", "LspInfo" },
      I = { "<cmd>LspInstallInfo<cr>", "LspInstallInfo" },
      s = { "<cmd>lua require('spectre').open_file_search()<CR>", "Spectre" },
      c = { "<cmd>VCoolor<cr>", "HEX Insertion" },
      -- cr = { "<cmd>VCoolIns r<cr>", "RGB Insertion" },
      u = { "<cmd>UndotreeToggle<cr>", "UndotreeToggle" },
      a = { "<cmd>ASToggle<cr>", "AutoSave Toggle" },
      p = { "<cmd>PasteImg<cr>", "Paste Image" },
      S = { "<cmd>SymbolsOutline<cr>", "SymbolsOutline" },
    },
    s = {
      name = "Session Len",
      s = { "<cmd>SaveSession<cr>", "Save session" },
      r = { "<cmd>RestoreSession<cr>", "Restore session" },
      d = { "<cmd>DeleteSession<cr>", "Delete session" },
      l = { "<cmd>lua require('session-lens').search_session()<cr>", "Search session" },
    },
    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
