local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
  print("legendary not working")
end

local toolbox = require("legendary.toolbox")

local function get_visual_selection()
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

local function close_all_but_current_buffer()
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

local function live_grep_from_project_git_root()
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
    opts = { cwd = get_git_root() }
  end
  -- If in visual mode, get the selected text and add it to opts
  if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "^V" then
    opts.default_text = get_visual_selection()
  end
  -- require("telescope.builtin").live_grep(opts)
  require("telescope").extensions.egrepify.egrepify(opts)
end

local function find_files_from_project_git_root()
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

local function markdown_preview()
  local buf = vim.api.nvim_create_buf(false, true)
  local current_buf = vim.api.nvim_get_current_buf()

  local lines = vim.api.nvim_buf_get_lines(current_buf, 0, -1, false)
  local markdownm = table.concat(lines, "\n")

  local sanitized = markdownm:gsub("'", "'\\''")
  local sanitized_final = "'" .. sanitized .. "'"

  vim.cmd("rightbelow vert sbuffer " .. buf)

  local new_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_option(new_win, "number", false)
  vim.api.nvim_win_set_option(new_win, "cursorline", false)
  vim.api.nvim_win_set_option(new_win, "relativenumber", false)

  vim.fn.termopen("glow <( echo " .. sanitized_final .. ")\n")
end

legendary.setup({
  include_builtin = false,
  include_legendary_cmds = false,
  sort = {
    -- NOTE: this takes precedence over other sort options
    frecency = {
      db_root = string.format("%s/legendary/", vim.fn.stdpath("data")),
      max_timestamps = 20,
    },
  },
  keymaps = {
    -- NOTE: the following are available:
    -- J!!, K!!, H, L, gh
    -- C-j, C-k, C-e, C-t, C-y
    -- <leader> b, e, g, h, i, k, p, u, v, w, y, z

    -- <leader>g
    { "<leader>gr", '<cmd>lua require("ranger-nvim").open(true)<CR>', description = "Ranger" },
    { "<leader>gt", "<cmd>ToggleTerm<CR>", description = "New terminal" },
    { "<leader>gu", "<cmd>UndotreeToggle<CR>", description = "Undotree: Toggle" },
    { "<leader>gf", "<cmd>Oil --float<CR>", description = "Oil" },

    -- <C-KEY>
    { "<C-f>", "<cmd>NvimTreeToggle<CR>", description = "Tree: Toggle" },
    { "<C-q>", "<cmd>LazyGit<CR>", description = "Lazygit" },

    {
      "<C-g>",
      function()
        find_files_from_project_git_root()
      end,
      description = "Telescope: Find Files",
    },

    -- { "<C-p>", "<cmd>Legendary<CR>", description = "Legendary Command Palette", mode = { "n", "i", "x" } },
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
      mode = { "n", "i", "x" },
    },

    { "<C-d>", "<cmd>lua Scroll('<C-f>', 1, 1)<CR>", description = "Smooth scrolling: down", mode = { "n", "x" } },
    { "<C-u>", "<cmd>lua Scroll('<C-b>', 1, 1)<CR>", description = "Smooth scrolling: up", mode = { "n", "x" } },

    -- { "<C-f>", '<C-R>"', description = "Paste Last Yanked / Deleted", mode = { "i" } },
    { "<C-v>", "<C-R>*", description = "Paste Clipboard Content", mode = { "i", "c" } },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Telescope                                                │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<leader>fb",
      {
        n = "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
        v = function()
          local text = get_visual_selection()
          require("telescope.builtin").current_buffer_fuzzy_find({ default_text = text })
        end,
      },
      description = "Telescope: Find Text in Current Buffer",
    },
    {
      "<leader>fg",
      function()
        live_grep_from_project_git_root()
      end,
      description = "Telescope: Find Text",
      mode = { "n", "x" },
    },
    {
      "<leader>ff",
      "<cmd>lua require('telescope.builtin').find_files()<CR>",
      description = "Telescope: Find Files in Current Directory",
    },
    { "<leader>fd", "<cmd>Telescope frecency<CR>", description = "Telescope: Find Frecency" },
    {
      "<leader>fz",
      '<cmd>lua require("telescope").extensions.zoxide.list()<CR>',
      description = "Telescope: Zoxide",
    },
    { "<leader>fr", "<cmd>Telescope resume<CR>", description = "Telescope: Resume" },
    { "<leader>ft", "<cmd>Telescope scope buffers<CR>", description = "Telescope: Tabs" },
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
      function()
        require("spectre").open({
          cwd = vim.fn.getcwd(),
          is_insert_mode = false,
          is_close = true,
        })
      end,
      description = "Spectre: Search in Project",
    },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ LSP                                                      │
    -- ╰──────────────────────────────────────────────────────────╯
    { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", description = "LSP: Line Diagnostics" },
    { "gL", "<cmd>Lspsaga show_buf_diagnostics<CR>", description = "LSP: Buffer Diagnostics" },
    { "gh", "<cmd>Lspsaga hover_doc ++quiet<CR>", description = "LSP: Hover Doc (quiet)" },
    { "gH", "<cmd>Lspsaga hover_doc ++keep<CR>", description = "LSP: Hover Doc (keep)" },

    { "gd", "<cmd>Lspsaga goto_definition<CR>", description = "LSP: Go to Definition" },
    { "gD", "<cmd>Lspsaga peek_definition<CR>", description = "LSP: Preview Definition" },

    { "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", description = "LSP: Go to Type Definition" },

    { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", description = "LSP: Reference List" },
    { "gR", '<cmd>require("trouble").toggle("lsp_references")<CR>', description = "LSP: Reference List" },
    -- { "gR", "<cmd>Telescope lsp_references<CR>", description = "LSP: Reference List" },

    { "<leader>rn", "<cmd>Lspsaga rename<CR>", description = "LSP: Rename" },
    { "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>", description = "LSP: Finder: Symbol, Definition and Implementation" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", description = "LSP: Signature Help" },
    { "<leader>lc", "<cmd>Lspsaga code_action<CR>", description = "LSP: Code Action" },
    { "<leader>ln", "<cmd>Navbuddy<CR>", description = "LSP: Navbuddy" },
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
    { "<leader>xx", '<cmd>lua require("trouble").open()<CR>', description = "LSP: Document Diagnostics" },
    { "<leader>xc", "<cmd>copen<CR>", description = "LSP: Quickfix List" },
    {
      "<leader>xw",
      '<cmd>lua require("trouble").open("workspace_diagnostics")<CR>',
      description = "LSP: Workspace Diagnostics",
    },
    {
      "<leader>xd",
      '<cmd>lua require("trouble").open("document_diagnostics")<CR>',
      description = "LSP: Document Diagnostics",
    },
    { "<leader>xl", '<cmd>lua require("trouble").open("loclist")<CR>', description = "LSP: Location List" },
    { "<leader>xt", "<cmd>TodoQuickFix<CR>", description = "Todo Quickfix" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ bufferline                                               │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<C-h>", "<cmd>BufferLineCyclePrev<CR>", description = "Buffer: Move to Previous" },
    { "<C-l>", "<cmd>BufferLineCycleNext<CR>", description = "Buffer: Move to Next" },
    { "<A-,>", "<cmd>BufferLineMovePrev<CR>", description = "Buffer: Re-order to Previous" },
    { "<A-.>", "<cmd>BufferLineMoveNext<CR>", description = "Buffer: Re-order to Next" },
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
        close_all_but_current_buffer()
      end,
      description = "Buffer: Close All But Current",
    },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Tab (for scope.nvim)                                     │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>th", "<cmd>tabprev<CR>", description = "Tab: Previous" },
    { "<leader>tl", "<cmd>tabnext<CR>", description = "Tab: Next" },
    { "<leader>tn", "<cmd>tabnew<CR>", description = "Tab: New" },
    { "<leader>tc", "<cmd>tabclose<CR>", description = "Tab: Close" },

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

    {
      "gs",
      function()
        require("flash").treesitter()
      end,
      description = "Flash Treesitter",
      mode = { "n", "x", "o" },
    },

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
    -- │ Diffview                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>di", "<cmd>DiffviewOpen<CR>", description = "Diffview: Compare Index" },
    { "<leader>dh", "<cmd>DiffviewOpen HEAD~1<CR>", description = "Diffview: Current Commit and Commit Before" },

    { "<leader>db", "<cmd>DiffviewFileHistory<CR>", description = "Diffview: File History of Current Branch" },
    { "<leader>df", "<cmd>DiffviewFileHistory %<CR>", description = "Diffview: File History of Current File" },
    {
      "<leader>dr",
      "<cmd>'<,'>DiffviewFileHistory<CR>",
      description = "Diffview: Line History of Range of Current File",
      mode = "v",
    },
    { "<leader>dh", "<cmd>Gitsigns preview_hunk<CR>", description = "Diffview: Preview Hunk" },
    {
      "<leader>dXl",
      "<cmd>Gitsigns toggle_current_line_blame<CR>",
      description = "Diffview: Toggle Current Line Blame",
    },

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
    -- │  Grapple                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    { "mm", toolbox.lazy_required_fn("grapple", "popup_tags"), description = "Grapple: View All Tags" },
    { "MM", toolbox.lazy_required_fn("grapple", "toggle"), description = "Grapple: Tag or Untag File" },
    { "m1", "<cmd>lua require('grapple').select({key = 1})<CR>", description = "Grapple: File 1" },
    { "m2", "<cmd>lua require('grapple').select({key = 2})<CR>", description = "Grapple: File 2" },
    { "m3", "<cmd>lua require('grapple').select({key = 3})<CR>", description = "Grapple: File 3" },
    { "m4", "<cmd>lua require('grapple').select({key = 4})<CR>", description = "Grapple: File 4" },
    { "m5", "<cmd>lua require('grapple').select({key = 5})<CR>", description = "Grapple: File 5" },
    { "m6", "<cmd>lua require('grapple').select({key = 6})<CR>", description = "Grapple: File 6" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Scratchpad                                               │
    -- ╰──────────────────────────────────────────────────────────╯
    {
      "<leader>so",
      "<cmd>Scratch<CR>",
      description = "scratch: create new",
    },
    -- {
    --   "<leader>sm",
    --   '<cmd>lua require("scratch.scratch_file").createScratchFileByType("md")<CR>',
    --   description = "scratch: create md",
    -- },
    {
      "<leader>ss",
      '<cmd>lua require("scratch.scratch_file").scratchPad()<CR>',
      description = "scratch: open scratchPad",
    },
    {
      "<leader>sf",
      '<cmd>lua require("scratch.scratch_file").openScratch()<CR>',
      description = "scratch: open an old file",
    },
    {
      "<leader>sc",
      '<cmd>lua require("scratch.scratch_file").fzfScratch()<CR>',
      description = "scratch: search content",
    },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ AI                                                       │
    -- ╰──────────────────────────────────────────────────────────╯
    { "<leader>ao", "<cmd>ChatGPT<CR>", description = "GPT: Open" },
    { "<leader>as", "<cmd>ChatGPTActAs<CR>", description = "GPT: Act As" },
    {
      "<leader>ar",
      function()
        vim.api.nvim_feedkeys(":ChatGPTRun ", "n", true)
      end,
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
      "<leader>al",
      "<cmd>ChatGPTRun code_readability_analysis<CR>",
      description = "GPT: Code Readability Analysis",
      mode = { "n", "v" },
    },
    {
      "<leader>ae",
      "<cmd>ChatGPTEditWithInstructions<CR>",
      description = "GPT: Edit with instruction",
      mode = { "n", "v" },
    },
    {
      "<leader>af",
      "<cmd>ChatGPTRun fix_bugs<CR>",
      description = "GPT: Fix Bugs",
      mode = { "n", "v" },
    },
    -- {
    --   "<leader>as",
    --   "<cmd>ChatGPTRun summarize<CR>",
    --   description = "GPT: Summarize",
    --   mode = { "n", "v" },
    -- },
    -- {
    --   "<leader>aa",
    --   "<cmd>ChatGPTRun add_tests<CR>",
    --   description = "GPT: Add Tests",
    --   mode = { "n", "v" },
    -- },
    -- {
    --   "<leader>ac",
    --   "<cmd>ChatGPTRun optimize_code<CR>",
    --   description = "GPT: Optimize Code",
    --   mode = { "n", "v" },
    -- },
    -- {
    --   "<leader>ak",
    --   "<cmd>ChatGPTRun keywords<CR>",
    --   description = "GPT: Generate keywords",
    --   mode = { "n", "v" },
    -- },
    -- {
    --   "<leader>ad",
    --   "<cmd>ChatGPTRun docstring<CR>",
    --   description = "GPT: Generate docstring",
    --   mode = { "n", "v" },
    -- },
    -- {
    --   "<leader>aR",
    --   "<cmd>ChatGPTRun roxygen_edit<CR>",
    --   description = "GPT: Roxygen Edit",
    --   mode = { "n", "v" },
    -- },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │ leetcode                                                 │
    --  ╰──────────────────────────────────────────────────────────╯
    { "<leader>cm", "<cmd>LcMenu<CR>", description = "leetcode: opens menu dashboard" },
    { "<leader>cc", "<cmd>LcConsole<CR>", description = "leetcode: opens console for currently opened question" },
    {
      "<leader>cq",
      "<cmd>LcQuestionTabs<CR>",
      description = "leetcode: opens a picker with all currently opened question tabs",
    },
    {
      "<leader>cl",
      "<cmd>LcLanguage<CR>",
      description = "leetcode: opens a picker to select a language for the current session",
    },
    { "<leader>cd", "<cmd>LcDescriptionToggle<CR>", description = "leetcode: toggle question description" },
    { "<leader>cr", "<cmd>LcRun<CR>", description = "leetcode: run currently opened question" },
    { "<leader>cs", "<cmd>LcSubmit<CR>", description = "leetcode: submit currently opened question" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │   nap.nvim (for reference only)                          │
    -- ╰──────────────────────────────────────────────────────────╯
    { "gjd", "", description = "nap: Next diagnostic" },
    { "gkd", "", description = "nap: Previous diagnostic" },
    { "gjg", "", description = "nap: Next Hunk" },
    { "gkg", "", description = "nap: Previous Hunk" },
    { "gjm", "", description = "nap: Nexts Grapple Tag" },
    { "gkm", "", description = "nap: Previous Grapple Tag" },
    { "gjt", "", description = "nap: Next todo comment" },
    { "gkt", "", description = "nap: Previous todo comment" },
    { "gje", "", description = "nap: Next changelist item" },
    { "gke", "", description = "nap: Previous changelist item" },
    { "gjc", "", description = "nap: Next quickfix item" },
    { "gkc", "", description = "nap: Previous quickfix item" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │   Miscellaneous Keymaps                                  │
    -- ╰──────────────────────────────────────────────────────────╯
    -- https://github.com/nvim-treesitter/nvim-treesitter#i-experience-weird-highlighting-issues-similar-to-78
    {
      "<c-s>",
      "<cmd>w<CR>",
      -- "<cmd>wa | edit | lua vim.lsp.buf.format()<CR> | TSBufEnable highlight<CR>zz",
      mode = { "n", "i" },
      opts = { noremap = true, silent = true },
    },
    { "<C-w>o", "<cmd>NeoZoomToggle<CR>", description = "Zoom: Toggle" },

    { "<leader>q", "<cmd>wqa<CR>", description = "Quit" },
    { "<leader>Q", "<cmd>q!<CR>", description = "Force Quit" },
    { "qq", "<cmd>Bdelete<CR>", description = "Buffer: Close" },
    { "Q", "<cmd>close<CR>", description = "Window: Close" },

    -- ╭──────────────────────────────────────────────────────────╮
    -- │   Miscellaneous (leader M; random shortcuts)             │
    -- ╰──────────────────────────────────────────────────────────╯
    -- session
    { "<leader>MXss", "<cmd>SessionSave<CR>", description = "Session: Save" },
    { "<leader>MXsr", "<cmd>SessionRestore<CR>", description = "Session: Restore" },
    { "<leader>MXsd", "<cmd>SessionDelete<CR>", description = "Session: Delete" },
    { "<leader>MXsl", "<cmd>lua require('session-lens').search_session()<CR>", description = "Session: Search" },

    --  vim-caser
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

    -- jdtls
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

    -- LSP
    { "<leader>MXls", "<cmd>Lazy sync<CR>", description = "Lazy: Update" },
    { "<leader>MXlc", "<cmd>Lazy clean<CR>", description = "Lazy: Clean" },
    { "<leader>MXli", "<cmd>LspInfo<CR>", description = "LSP: Info" },
    { "<leader>MXlm", "<cmd>Mason<CR>", description = "LSP: Install Info" },

    -- global commands
    {
      "<leader>MXgga",
      function()
        vim.api.nvim_feedkeys(":g/^$/d", "n", true)
      end,
      description = "g: Remove Empty Lines",
    },
    {
      "<leader>MXggb",
      function()
        vim.api.nvim_feedkeys(":g/^foo$/d", "n", true)
      end,
      description = "g: Delete Lines Only Contain foo",
    },
    {
      "<leader>MXggc",
      function()
        vim.api.nvim_feedkeys(":g!/^foo$/d", "n", true)
      end,
      description = "g: Delete Lines NOT are foo",
    },
    {
      "<leader>MXggd",
      function()
        vim.api.nvim_feedkeys(":g/foo/d", "n", true)
      end,
      description = "g: Delete Lines Containing foo Anywhere in the Line",
    },
    {
      "<leader>MXgge",
      function()
        vim.api.nvim_feedkeys(":g/foo/normal! A;", "n", true)
      end,
      description = "g: Run Normal Mode Commands on Line(s) Containing foo",
    },
    {
      "<leader>MXggf",
      function()
        vim.api.nvim_feedkeys(":g/foo/normal! @a", "n", true)
      end,
      description = "g: Run Macro a Line(s) Containing foo",
    },
    {
      "<leader>MXggg",
      function()
        vim.api.nvim_feedkeys(":g/foo/g/bar/d", "n", true)
      end,
      description = "g: Deletes Lines Containing Both foo and bar",
    },
    {
      "<leader>MXggh",
      function()
        vim.api.nvim_feedkeys(":g/foo/t $", "n", true)
      end,
      description = "g: t (copy) All foo matches to end of file",
    },
    {
      "<leader>MXggi",
      function()
        vim.api.nvim_feedkeys(":g/foo/m $", "n", true)
      end,
      description = "g: (m)ove all foo matches to end of file",
    },

    -- misc
    { "<leader>MXbm", "<cmd>ScopeMoveBuf<CR>", description = "Scope: Move Current Buffer to Specified Tab" },
    {
      "<leader>MXta",
      function()
        vim.api.nvim_feedkeys(":verbose map <C-i>", "n", true)
      end,
      description = "verbose: Find Keybinding Conflict",
    },
    {
      "<leader>MXcd",
      function()
        vim.api.nvim_feedkeys(":cdo s/foo/bar/gc | update", "n", true)
      end,
      description = "cdo: Execute Command on Quickfix Entries",
      filters = { filetype = "qf", "Trouble" },
    },
    {
      "<leader>MXld",
      function()
        vim.api.nvim_feedkeys(":ldo s/foo/bar/gc | update", "n", true)
      end,
      description = "ldo: Execute Command on Location List Entries",
      filters = { filetype = "qf", "Trouble" },
    },

    {
      "<leader>MXxp",
      function()
        markdown_preview()
      end,
      description = "Preview Markdown",
    },

    { "<leader>MXse", "<cmd>ScrollViewToggle<CR>", description = "ScrollViewToggle: Enable" },
    { "<leader>MXsd", "<cmd>TSContextToggle<CR>", description = "TSContextToggle: Toggle" },

    { "<leader>MXcp", "<cmd>Colortils picker<CR>", description = "Colortils: Picker" },
    { "<leader>MXcl", "<cmd>Colortils css list<CR>", description = "Colortils: CSS List" },
    -- { "<leader>MCLP", "<cmd>PasteImg<CR>", description = "Misc: Paste Image" },
    {
      "<leader>MXcb",
      "<cmd>lua require('comment-box').llbox()<CR><Esc>",
      description = "Comment Box: Left-aligned",
      mode = { "x" },
    },
    {
      "<leader>MXrts",
      "<cmd>%s/\t/  /g<CR>",
      description = "Replace Tabs with Spaces",
    },
    {
      "<leader>MXttw",
      "<cmd>lua MiniTrailspace.trim()<CR>",
      description = "Trim all trailing whitespace",
    },
    {
      "<leader>MXttes",
      "<cmd>'<,'>s/ .*//gc<CR>",
      description = "Delete everything after a space",
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
    {
      "<leader>MXsel",
      function()
        vim.api.nvim_feedkeys(":s/$/xx", "n", true)
      end,
      description = "Substitute The End Of Each Line",
      mode = { "v" },
    },
  },
})
