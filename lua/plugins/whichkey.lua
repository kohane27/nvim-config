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
  ["<C-e>"] = { "<cmd>TerminatorOutputBufferToggle<cr>", "Toggle Terminator" },
  ["<C-t>"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["<C-j>"] = {
    '<cmd>lua vim.diagnostic.open_float(0, {scope="line", border = "rounded" })<cr>',
    "Line Diagnostic",
  },
  ["<C-k>"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
  -- K = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
  g = {
    -- can't use gs and gS; taken by lightspeed
    name = "g",

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
  },
  ["<leader>"] = {
    t = {
      name = "Terminal",
      r = { "<cmd>FloatermNew ranger<cr>", "Ranger" },
      l = {
        "<cmd>FloatermNew --height=0.9 --width=0.9 --wintype=float --position=center lazygit<cr>",
        -- "<cmd>FloatermNew lazygit<cr>",
        "lazygit",
      },
    },
    x = {
      name = "Trouble",
      d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
      D = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
      q = { "<cmd>BqfToggle<cr>", "Quickfix" },
      l = { "<cmd>Trouble loclist<cr>", "Location List" },
    },
    f = {
      name = "Find",
      f = { "<cmd>Telescope find_files<cr>", "Find files" },
      F = { "<cmd>Telescope frecency<cr>", "Find frecency" },
      g = { "<cmd>Telescope live_grep<cr>", "Find text" },
      b = { "<cmd>Telescope current_buffer_fuzzy_find fuzzy=true case_mode=ignore_case<cr>", "Buffers" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      p = { "<cmd>Telescope projects<cr>", "Projects" },
      -- rarely use
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      -- R = { "<cmd>Telescope registers<cr>", "Registers" },
      -- k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      -- c = { "<cmd>Telescope commands<cr>", "Commands" },
    },

    g = {
      name = "Git",
      d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      -- l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      -- r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      -- R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      -- s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      -- u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
      -- s = { "<cmd>:G<cr>", "Status" },
    },
    r = {
      name = "Run Code",
      -- vnoremap <leader>rf :TerminatorRunPartOfFileInOutputBuffer<CR>
      f = { "<cmd>TerminatorRunFileInOutputBuffer<cr>", "Run File" },
      -- vnoremap <leader>rs :<Plug>SnipRun<CR>
      s = { "<cmd>SnipRun<cr>", "Run Snip" },
      c = { "<cmd>SnipClose<cr>", "Close Snip" },
    },
    m = {
      name = "Miscellaneous",
      u = { "<cmd>UndotreeToggle<cr>", "UndotreeToggle" },
      p = { "<cmd>PasteImg<cr>", "Paste Image" },
      i = { "<cmd>LspInfo<cr>", "LspInfo" },
      I = { "<cmd>LspInstallInfo<cr>", "LspInstallInfo" },
    },
    h = {
      name = "Harpoon",
      a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "mark files" },
      m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "view all project marks" },
      n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "navigates to next mark" },
      p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "navigates to previous mark" },
      ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "navigates to file 1" },
      ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "navigates to file 2" },
      ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "navigates to file 3" },
      ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "navigates to file 4" },
      ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "navigates to file 5" },
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
