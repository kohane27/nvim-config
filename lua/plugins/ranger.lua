local status_ok, ranger_nvim = pcall(require, "ranger-nvim")
if not status_ok then
  print("ranger_nvim not working")
end

ranger_nvim.setup({
  keybinds = {
    ["<C-w>v"] = ranger_nvim.OPEN_MODE.vsplit,
    ["<C-w>s"] = ranger_nvim.OPEN_MODE.split,
    ["<C-w>t"] = ranger_nvim.OPEN_MODE.tabedit,
  },
  ui = {
    border = "rounded",
    height = 0.8,
    width = 0.8,
    x = 0.5,
    y = 0.5,
  },
})
