local status_ok, nvim_surround = pcall(require, "nvim-surround")
if not status_ok then
  print("nvim-surround not working")
end

nvim_surround.setup({
  keymaps = {
    insert = nil,
    insert_line = nil,
    normal = "ys",
    normal_cur = "yss",
    normal_line = nil,
    normal_cur_line = nil,
    visual = "<c-s>",
    visual_line = nil,
    delete = "ds",
    change = "cs",
  },
})
