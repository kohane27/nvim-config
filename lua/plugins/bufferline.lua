local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  print("bufferline not working")

end

bufferline.setup({
  options = {
    color_icons = true,
    show_buffer_icons = true,
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_buffer_default_icon = true,
    show_close_icon = false,
    show_tab_indicators = true,
    show_duplicate_prefix = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true,
      },
    },
  },
})
