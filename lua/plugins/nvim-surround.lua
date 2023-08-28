local status_ok, nvim_surround = pcall(require, "nvim-surround")
if not status_ok then
  print("nvim-surround not working")
end

vim.keymap.set("n", "yS", "<Plug>(nvim-surround-normal)$")

nvim_surround.setup({
  surrounds = {
    ["("] = false,
    ["{"] = false,
    ["["] = false,
  },
  aliases = {
    ["("] = ")",
    ["{"] = "}",
    ["["] = "]",
  },
  keymaps = {
    insert = false,
    insert_line = false,
    normal = "ys",
    normal_cur = "yss",
    normal_line = false,
    normal_cur_line = false,
    visual = "S",
    visual_line = false,
    delete = "ds",
    change = "cs",
  },
})
