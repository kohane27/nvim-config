return {
  "akinsho/bufferline.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      buffer_close_icon = " ",
      modified_icon = " ",
      close_icon = " ",
      truncate_names = false,
      -- a/index.sh b/index.sh
      show_duplicate_prefix = true,
      max_prefix_length = 30,
      max_name_length = 50,

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
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}
