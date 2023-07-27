local status_ok, ranger_nvim = pcall(require, "ranger-nvim")
if not status_ok then
  print("ranger_nvim not working")
end

ranger_nvim.setup({
  keybinds = {
    ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
    ["oh"] = ranger_nvim.OPEN_MODE.split,
    ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
    ["or"] = ranger_nvim.OPEN_MODE.rifle,
  },
})
