local status_ok, fm_nvim = pcall(require, "fm-nvim")
if not status_ok then
  print("fm-nvim not working")
end

fm_nvim.setup({
  mappings = {
    vert_split = "<C-w>v",
    horz_split = "<C-w>s",
    tabedit = "<C-w>t",
    edit = "<C-w>o",
    ESC = "<ESC>",
  },
  edit_cmd = "edit",
  -- run yourFunction() upon exiting the floating window (can only be a function)
  on_close = {},
  -- run yourFunction() upon opening the floating window (can only be a function)
  on_open = {},

  ui = {
    -- "split" or "float"
    default = "float",
    float = {
      border = "rounded",
      -- Floating Window Transparency (see ':h winblend')
      blend = 0,
      -- Highlight group for floating window/border (see ':h winhl')
      float_hl = "Normal",
      border_hl = "FloatBorder",
      -- Num from 0 - 1 for measurements
      height = 0.9,
      width = 0.9,
      -- X and Y Axis of Window
      x = 0.5,
      y = 0.5,
    },
  },

  -- Terminal commands used w/ file manager (have to be in your $PATH)
  cmds = {
    lf_cmd = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
    fm_cmd = "fm",
    nnn_cmd = "nnn",
    fff_cmd = "fff",
    twf_cmd = "twf",
    fzf_cmd = "fzf", -- eg: fzf_cmd = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
    fzy_cmd = "find . | fzy",
    xplr_cmd = "xplr",
    vifm_cmd = "vifm",
    skim_cmd = "sk",
    broot_cmd = "broot",
    gitui_cmd = "gitui",
    ranger_cmd = "ranger",
    joshuto_cmd = "joshuto",
    lazygit_cmd = "lazygit",
    neomutt_cmd = "neomutt",
    taskwarrior_cmd = "taskwarrior-tui",
  },
})
