return {
  "akinsho/bufferline.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      numbers = "ordinal",
      right_mouse_command = false,
      middle_mouse_command = false,

      -- always show file's immediate parent
      -- name_formatter = function(buf)
      --   local path = buf.path
      --   local parts = {}
      --   for part in string.gmatch(path, "[^/\\]+") do
      --     table.insert(parts, part)
      --   end
      --
      --   local len = #parts
      --   if len > 1 then
      --     return parts[len - 1] .. "/" .. parts[len]
      --   else
      --     return parts[len]
      --   end
      -- end,

      max_name_length = 50,
      max_prefix_length = 30,
      truncate_names = false,
      offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left", separator = true } },
      get_element_icon = function(element)
        local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
        return icon, hl
      end,
      show_buffer_close_icons = false,
      show_close_icon = false,
      hover = { enabled = false },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}
