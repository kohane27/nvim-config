local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  print("bufferline not working")
end

bufferline.setup({
  options = {
    buffer_close_icon = " ",
    modified_icon = " ",
    close_icon = " ",
    truncate_names = true,
    max_prefix_length = 15,
    max_name_length = 18,

    color_icons = true,
    show_buffer_icons = true,
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    get_element_icon = function(element)
      local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
    end,
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
