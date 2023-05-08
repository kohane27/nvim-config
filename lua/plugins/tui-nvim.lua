local status_ok, tui_nvim = pcall(require, "tui-nvim")
if not status_ok then
  print("tui_nvim not working")
end

tui_nvim.setup({
  -- File that is read from
  -- useful for file managers
  temp = "/tmp/tui-nvim",

  -- Command used to open files
  method = "edit",

  mappings = {
    { "<ESC>", "<C-\\><C-n>:q<CR>" },
  },

  -- Execute functions upon open/exit
  on_open = {},
  on_exit = {},

  -- Window border (see ':h nvim_open_win')
  border = "rounded",

  -- Highlight group for window/border (see ':h winhl')
  borderhl = "Normal",
  winhl = "Normal",

  -- Window transparency (see ':h winblend')
  winblend = 0,

  height = 0.9,
  width = 0.9,
  y = 0.5,
  x = 0.5,
})

function Ranger()
  require("tui-nvim"):new({
    -- Write selected files to '/tmp/tui-nvim'
    cmd = "ranger --choosefiles=/tmp/tui-nvim --selectfile=" .. vim.fn.fnameescape(vim.fn.expand("%:p")),
    -- Read and open files from '/tmp/tui-nvim'
    temp = "/tmp/tui-nvim",
    -- Open files in splits
    -- method = "vsplit",
    method = "edit",
  })
end

vim.cmd([[ command! Ranger :lua Ranger()<CR> ]])
