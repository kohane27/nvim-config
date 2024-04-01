return {
  "kelly-lin/ranger.nvim",
  config = function()
    local ranger = require("ranger-nvim")
    require("ranger-nvim").setup({
      keybinds = {
        ["<C-w>v"] = ranger.OPEN_MODE.vsplit,
        ["<C-w>s"] = ranger.OPEN_MODE.split,
        ["<C-w>t"] = ranger.OPEN_MODE.tabedit,
      },
      ui = {
        border = "rounded",
        height = 0.95,
        width = 0.95,
        x = 0.5,
        y = 0.5,
      },
    })
  end,
}
