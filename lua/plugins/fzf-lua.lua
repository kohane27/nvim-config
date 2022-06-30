local status_ok, fzf_lua = pcall(require, "fzf-lua")
if not status_ok then
  return
end

local actions = require("fzf-lua.actions")

fzf_lua.setup({
  winopts = {
    -- Only valid when using a float window
    -- (i.e. when 'split' is not defined, default)
    height = 0.95, -- window height
    width = 0.95, -- window width
    row = 0.35, -- window row position (0=top, 1=bottom)
    col = 0.50, -- window col position (0=left, 1=right)
    preview = {
      border = "border",
      wrap = "nowrap", -- wrap|nowrap
      hidden = "nohidden", -- hidden|nohidden
      vertical = "down:45%", -- up|down:size
      horizontal = "right:60%", -- right|left:size
      layout = "horizontal", -- horizontal|vertical|flex
      flip_columns = 999, -- #cols to switch to horizontal on flex
      title = true, -- preview border title (file/buf)?
      scrollbar = "float", -- `false` or string:'float|border'
      scrolloff = "-2", -- float scrollbar offset from right
      scrollchars = { "█", "" }, -- scrollbar chars ({ <full>, <empty> }
      delay = 100, -- delay(ms) displaying the preview
    },
  },
  keymap = {
    fzf = {
      -- fzf '--bind=' options
      ["ctrl-z"] = "abort",
      ["ctrl-u"] = "unix-line-discard",
      ["ctrl-f"] = "half-page-down",
      ["ctrl-b"] = "half-page-up",
      ["ctrl-e"] = "end-of-line",
      ["alt-a"] = "toggle-all",
      -- Only valid with fzf previewers (bat/cat/git/etc)
      ["shift-down"] = "preview-page-down",
      ["shift-up"] = "preview-page-up",
    },
  },
  actions = {
    files = {
      ["default"] = actions.file_edit_or_qf,
      ["ctrl-s"] = actions.file_split,
      ["ctrl-v"] = actions.file_vsplit,
      ["ctrl-t"] = actions.file_tabedit,
      ["alt-q"] = actions.file_sel_to_qf,
    },
    buffers = {
      ["default"] = actions.buf_edit,
      ["ctrl-s"] = actions.buf_split,
      ["ctrl-v"] = actions.buf_vsplit,
      ["ctrl-t"] = actions.buf_tabedit,
    },
  },
  fzf_opts = {
    ["--ansi"] = "",
    ["--prompt"] = "> ",
    ["--info"] = "inline",
    ["--height"] = "100%",
    ["--layout"] = "reverse",
    ["--border"] = "none",
  },
  files = {
    prompt = "Files❯ ",
    -- path_shorten   = 1,              -- 'true' or number, shorten path?
    -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
    -- default options are controlled by 'fd|rg|find|_opts'
    -- cmd            = "find . -type f -printf '%P\n'",
    find_opts = [[-type f -not -path '*/\.git/*' -not -path '*/node_modules/*' -printf '%P\n']],
    rg_opts = "--color=never --files --hidden --follow -g '!.git' '!node_modules'",
    fd_opts = "--color=never --type f --hidden --follow --exclude node_modules --exclude .git",
  },
  grep = {
    prompt = "Rg❯ ",
    input_prompt = "Grep For❯ ",
    rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512 --no-require-git",
  },
  previewers = {
    bat = {
      cmd = "bat",
      args = "--style=numbers,changes --color always",
      theme = "Coldark-Dark", -- bat preview theme (bat --list-themes)
      config = nil, -- nil uses $BAT_CONFIG_PATH
    },
    builtin = {
      syntax = true, -- preview syntax highlight?
      syntax_limit_l = 1000, -- syntax limit (lines), 0=nolimit
      syntax_limit_b = 1024 * 1024, -- syntax limit (bytes), 0=nolimit
      limit_b = 1024 * 1024 * 10, -- preview limit (bytes), 0=nolimit
    },
  },
})
