local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
  print("legendary not working")
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

function vim.live_grep_from_project_git_root()
  if vim.fn.getcwd() == os.getenv("HOME") then
    return print("Current directory is home. Exiting")
  end
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  require("telescope.builtin").live_grep(opts)
end

function vim.find_files_from_project_git_root()
  if vim.fn.getcwd() == os.getenv("HOME") then
    return print("Current directory is home. Exiting")
  end
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  require("telescope.builtin").find_files(opts)
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
    -- NOTE: the following are available:
    -- gp, gn J, K, H, L, gj, gk

    -- <C-KEY>
    { "<C-t>", "<cmd>NvimTreeToggle<CR>", description = "Tree: Toggle" },
    { "<C-e>", "<cmd>Ranger<CR>", description = "Ranger" },
    { "<C-q>", "<cmd>LazyGit<CR>", description = "Lazygit" },
    -- { "<C-g>", "<cmd>lua require('telescope.builtin').find_files()<CR>", description = "Telescope: Find Files" },
    {
      "<C-g>",
      function()
        vim.find_files_from_project_git_root()
      end,
      description = "Telescope: Find Files",
    },

    { "<C-p>", "<cmd>Legendary<CR>", description = "Legendary Command Palette", mode = { "n", "i", "x" } },

    { "<C-f>", '<C-R>"', description = "Paste Last Yanked / Deleted", mode = { "i" } },
    { "<C-v>", "<C-R>*", description = "Paste Clipboard Content", mode = { "i" } },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Changelist                                               │
    -- ╰──────────────────────────────────────────────────────────╯
    { "g;", "<cmd>Portal changelist forward<CR>", description = "Changelist: Next" },
    { "g,", "<cmd>Portal changelist backward<CR>", description = "Changelist: Previous" },
    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Jumplist                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<C-o>", "<C-o>zz", description = "" },
    { "<C-i>", "<C-i>zz", description = "" },

    { "<A-o>", "<cmd>Portal jumplist backward<CR>", description = "Jumplist: Backward" },
    { "<A-i>", "<cmd>Portal jumplist forward<CR>", description = "Jumplist: Foward" },
    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Quickfix                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<A-p>", "<cmd>cprev<CR>zz", description = "Previous Quickfix Item" },
    { "<A-n>", "<cmd>cnext<CR>zz", description = "Next Quickfix Item" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Telescope                                                │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<leader>fb",
      {
        n = "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
        v = function()
          local text = vim.getVisualSelection()
          require("telescope.builtin").current_buffer_fuzzy_find({ default_text = text })
        end,
      },
      description = "Telescope: Find Text in Current Buffer",
    },
    {
      "<leader>fg",
      {
        n = function()
          vim.live_grep_from_project_git_root()
        end,
        v = function()
          local text = vim.getVisualSelection()
          require("telescope.builtin").live_grep({ default_text = text })
        end,
      },
      description = "Telescope: Find Text",
    },
    { "<leader>ff", "<cmd>lua require('telescope.builtin').git_files()<CR>", description = "Telescope: Find Files" },
    { "<leader>fF", "<cmd>Telescope frecency<CR>", description = "Telescope: Find Frecency" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>", description = "Telescope: Open Recent File" },
    {
      "<leader>fd",
      "<cmd>lua require('telescope').extensions.olddirs.picker()<CR>",
      description = "Telescope: Open Recent Directories",
    },
    { "<leader>fp", "<cmd>Telescope projects<CR>", description = "Telescope: Find Projects" },
    { "<leader>fr", "<cmd>Telescope neoclip<CR>", description = "Telescope: Clipboard History" },
    { "<leader>ft", "<cmd>Telescope buffers<CR>", description = "Telescope: Buffers" },
    { "<leader>fj", "<cmd>Telescope jumplist<CR>", description = "Telescope: Jumplist" },
    -- { "<leader>fc", "<cmd>lua require('fzf-lua').changes()<CR>", description = "Telescope: Changes" },
    { "<leader>fXc", "<cmd>Telescope command_history<CR>", description = "Telescope: Command History" },
    { "<leader>fXs", "<cmd>Telescope search_history<CR>", description = "Telescope: Search History" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ LSP                                                      │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>", description = "LSP: Finder: Symbol, Definition and Implementation" },
    { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", description = "LSP: Line Diagnostics" },

    -- { "gL", "<cmd>Lspsaga show_buf_diagnostics<CR>", description = "LSP: Buffer Diagnostics" }, -- weird
    { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", description = "LSP: Go to Previous Diagnostic" },
    { "]d", "<cmd> Lspsaga diagnostic_jump_next<CR>", description = "LSP: Go to Next Diagnostic" },
    { "[D", "<cmd>TroubleToggle workspace_diagnostics<CR>", description = "LSP: Workspace Diagnostics" },

    { "gd", "<cmd>Lspsaga peek_definition<CR>", description = "LSP: Preview Definition" },
    { "gD", "<cmd>Lspsaga goto_definition<CR>", description = "LSP: Go to Definition" },

    { "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", description = "LSP: Go to Type Definition" },

    { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", description = "LSP: Reference List" },
    { "gR", "<cmd>Trouble lsp_references<CR>", description = "LSP: Reference List" },
    -- { "gR", "<cmd>Telescope lsp_references<CR>", description = "LSP: Reference List" },

    { "<leader>rn", "<cmd>Lspsaga rename<CR>", description = "LSP: Rename" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", description = "LSP: Signature Help" },
    { "<leader>lh", "<cmd>Lspsaga hover_doc ++quiet<CR>", description = "LSP: Hover Doc" },
    { "<leader>lc", "<cmd>Lspsaga code_action<CR>", description = "LSP: Code Action" },
    { "<leader>ln", "<cmd>Navbuddy<CR>", description = "LSP: Navbuddy" },

    { "<leader>lXc", "<cmd>lua vim.lsp.codelens.run()<CR>", description = "LSP: Code Lens" },
    { "<leader>lXd", "<cmd>lua vim.lsp.buf.declaration<CR>", description = "LSP: Declaration" },
    { "<leader>lXf", "<cmd>lua vim.lsp.buf.format()<CR>", description = "LSP: Formatting" },
    { "<leader>lXl", "<cmd>TroubleToggle loclist<CR>", description = "LSP: Location List" },

    -- lesser used
    -- implementation (rarely) using `Lspsaga lsp_finder`
    -- { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", description = "LSP: Go to Implementation" },
    -- { "<leader>lq", "<cmd>copen<CR>", description = "LSP: Quickfix List" }, -- using `nvim-bqf`
    -- { "[D", "<cmd>TroubleToggle document_diagnostics<CR>", description = "LSP: Document Diagnostics" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ bufferline                                               │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<C-h>", "<cmd>BufferLineCyclePrev<CR>", description = "Buffer: Move to Previous" },
    { "<C-l>", "<cmd>BufferLineCycleNext<CR>", description = "Buffer: Move to Next" },
    { "<A-,>", "<cmd>BufferLineMovePrev<CR>", description = "Buffer: Re-order to Previous" },
    { "<A-.>", "<cmd>BufferLineMoveNext<CR>", description = "Buffer: Re-order to Next" },
    { "<A-c>", "<cmd>Bdelete<CR>", description = "Buffer: Close" },
    { "g1", "<cmd>BufferLineGoToBuffer 1<CR>", description = "Go to Buffer 1" },
    { "g2", "<cmd>BufferLineGoToBuffer 2<CR>", description = "Go to Buffer 2" },
    { "g3", "<cmd>BufferLineGoToBuffer 3<CR>", description = "Go to Buffer 3" },
    { "g4", "<cmd>BufferLineGoToBuffer 4<CR>", description = "Go to Buffer 4" },
    { "g5", "<cmd>BufferLineGoToBuffer 5<CR>", description = "Go to Buffer 5" },
    { "g6", "<cmd>BufferLineGoToBuffer 6<CR>", description = "Go to Buffer 6" },
    { "g7", "<cmd>BufferLineGoToBuffer 7<CR>", description = "Go to Buffer 7" },
    { "g8", "<cmd>BufferLineGoToBuffer 8<CR>", description = "Go to Buffer 8" },
    { "g9", "<cmd>BufferLineGoToBuffer 9<CR>", description = "Go to Buffer 9" },
    { "g0", "<cmd>BufferLineGoToBuffer -1<CR>", description = "Go to Buffer 10" },
    { "gXr", "<cmd>BufferLineCloseRight<CR>", description = "Buffer: Close All to the Right" },
    { "gXl", "<cmd>BufferLineCloseLeft <CR>", description = "Buffer: Close All to the Left" },
    {
      "gXa",
      function()
        vim.close_all_but_current_buffer()
      end,
      description = "Buffer: Close All But Current",
    },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ substitute.lua                                           │
    -- ╰──────────────────────────────────────────────────────────╯
    { "X", "<cmd>ISwapWith<CR>", description = "Swap" },
    {
      "cx",
      toolbox.lazy_required_fn("substitute.exchange", "operator"),
      description = "Exchange: Operator",
    },
    { "cxx", toolbox.lazy_required_fn("substitute.exchange", "line"), description = "Exchange: Line" },
    { "<C-a>", require("dial.map").inc_normal(), description = "Increment" },
    { "<C-x>", require("dial.map").dec_normal(), description = "Decrement" },

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
    -- │ Run Code                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>rf", "<cmd>RunCode<CR>", description = "Run File" },
    { "<leader>rs", "<cmd>SnipRun<CR>", description = "Run Snip" },
    { "<leader>rc", "<cmd>SnipClose<CR>", description = "Close Snip" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Terminal                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>tn", "<cmd>ToggleTerm<CR>", description = " New terminal" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │  Grapple                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "M", toolbox.lazy_required_fn("grapple", "popup_tags"), description = "Grapple: View All Tags" },
    { "<C-j>", toolbox.lazy_required_fn("grapple", "cycle_forward"), description = "Grapple: Next Tag" },
    { "<C-k>", toolbox.lazy_required_fn("grapple", "cycle_backward"), description = "Grapple: Previous Tag" },
    { "<leader>mm", toolbox.lazy_required_fn("grapple", "toggle"), description = "Grapple: Tag or Untag File" },
    { "m1", "<cmd>lua require('grapple').select({key = 1})<CR>", description = "Grapple: File 1" },
    { "m2", "<cmd>lua require('grapple').select({key = 2})<CR>", description = "Grapple: File 2" },
    { "m3", "<cmd>lua require('grapple').select({key = 3})<CR>", description = "Grapple: File 3" },
    { "m4", "<cmd>lua require('grapple').select({key = 4})<CR>", description = "Grapple: File 4" },
    { "m5", "<cmd>lua require('grapple').select({key = 5})<CR>", description = "Grapple: File 5" },
    { "m6", "<cmd>lua require('grapple').select({key = 6})<CR>", description = "Grapple: File 6" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ jdtls                                                    │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<leader>JXw",
      "<cmd>JdtWipeDataAndRestart<CR>",
      filters = { filetype = "java" },
      description = "jdtls: Wipe Data and Restart",
    },
    {
      "<leader>JXu",
      "<cmd>JdtUpdateConfig<CR>",
      filters = { filetype = "java" },
      description = "jdtls: Update Config",
    },
    {
      "<leader>JXa",
      "<cmd>lua require'jdtls'.organize_imports()<CR>",
      filters = { filetype = "java" },
      description = "jdtls: Organize Import",
    },
    {
      "<leader>JXb",
      "<cmd>lua require('jdtls').extract_variable()<CR>",
      filters = { filetype = "java" },
      description = "jdtls: Extract Variable",
    },
    {
      "<leader>JXc",
      "<csc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
      filters = { filetype = "java" },
      description = "jdtls: Extract Variable",
      mode = { "v" },
    },
    {
      "<leader>JXd",
      "<cmd>lua require('jdtls').extract_constant()<CR>",
      filters = { filetype = "java" },
      description = "jdtls: Extract Constant",
    },
    {
      "<leader>JXe",
      "<Esc><cmd>lua require('jdtls').extract_constant(true)<CR>",
      filters = { filetype = "java" },
      description = "jdtls: Extract Constant",
      mode = { "v" },
    },
    {
      "<leader>JXf",
      "<Esc><cmd>lua require('jdtls').extract_method(true)<CR>",
      filters = { filetype = "java" },
      description = "jdtls: Extract Method",
      mode = { "v" },
    },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Test                                                     │
    -- ╰──────────────────────────────────────────────────────────╯
    -- { "<leader>Gt", "<cmd>TestNearest<CR>", description = "Test: Nearest" },
    -- { "<leader>GT", "<cmd>TestFile<CR>", description = "Test: File" },
    -- { "<leader>Ga", "<cmd>TestSuite<CR>", description = "Test: Suite" },
    -- { "<leader>Gl", "<cmd>TestLast<CR>", description = "Test: Last" },
    -- { "<leader>Gg", "<cmd>TestVisit<CR>", description = "Test: Visit" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Session                                                  │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>SXs", "<cmd>SessionSave<CR>", description = "Session: Save" },
    { "<leader>SXr", "<cmd>SessionRestore<CR>", description = "Session: Restore" },
    { "<leader>SXd", "<cmd>SessionDelete<CR>", description = "Session: Delete" },
    { "<leader>SXl", "<cmd>lua require('session-lens').search_session()<CR>", description = "Session: Search" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │   Miscellaneous Keymaps                                  │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<c-s>",
      -- https://github.com/nvim-treesitter/nvim-treesitter#i-experience-weird-highlighting-issues-similar-to-78
      {
        n = "<cmd>wa | edit | lua vim.lsp.buf.format()<CR> | TSBufEnable highlight<CR>zz",
        i = "<cmd>wa<CR><Esc>zzi",
      },
      opts = { noremap = true, silent = true },
    },
    { "<C-w>o", "<cmd>lua require('neo-zoom').neo_zoom()<CR>", description = "Misc: Zoom: Toggle" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │   Miscellaneous (leader M)                               │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>MLs", "<cmd>Lazy sync<CR>", description = "Lazy: Update" },
    { "<leader>MLc", "<cmd>Lazy clean<CR>", description = "Lazy: Clean" },
    { "<leader>Mi", "<cmd>LspInfo<CR>", description = "LSP: Info" },
    { "<leader>MI", "<cmd>Mason<CR>", description = "LSP: Install Info" },
    { "<leader>Mo", "<cmd>Lspsaga outline<CR>", description = "LSP: Symbols Outline" },

    { "<leader>Mu", "<cmd>UndotreeToggle<CR>", description = "Undotree: Toggle" },
    { "<leader>Ma", "<cmd>ASToggle<CR>", description = "AutoSave: Toggle" },

    { "<leader>Mxxse", "<cmd>ScrollViewEnable<CR>", description = "ScrollView: Enable" },
    { "<leader>Mxxsd", "<cmd>ScrollViewDisable<CR>", description = "ScrollView: Disable" },

    -- { "<leader>MTT", "<cmd>TodoTelescope<CR>", description = "Todo Telescope" },
    { "<leader>MTQ", "<cmd>TodoQuickFix<CR>", description = "Todo QuickFix" },

    { "<leader>MCP", "<cmd>Colortils picker<CR>", description = "Colortils: Picker" },
    { "<leader>MCL", "<cmd>Colortils css list<CR>", description = "Colortils: CSS List" },
    -- { "<leader>mp", "<cmd>PasteImg<CR>", description = "Misc: Paste Image" },

    {
      "<leader>Ms",
      {
        n = toolbox.lazy_required_fn("spectre", "open_file_search"),
        v = '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      },
      description = "Spectre: Search Current File",
    },
    {
      "<leader>Mb",
      "<cmd>lua require('comment-box').llbox()<CR><Esc>",
      description = "Comment Box: Left-aligned",
      mode = { "x" },
    },
    {
      "<leader>MEL",
      "<cmd>g/^$/d<CR>",
      description = "Remove Empty Lines",
    },
    {
      "<leader>MRTWS",
      "<cmd>%s/\\s\\+$//e<CR>",
      description = "Remove Trailing Whitespace",
    },
    {
      "<leader>MRTwS",
      "<cmd>%s/\t/  /g<CR>",
      description = "Replace Tabs with Spaces",
    },

    {
      "<leader>MRTwAW",
      "<cmd>%s/\\s\\+$//e<CR>",
      description = "Remove All Whitespace",
    },
  },
})
