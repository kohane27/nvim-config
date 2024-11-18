return {
  "akinsho/bufferline.nvim",
  lazy = false,
  priority = 3000,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    local groups = require("bufferline.groups")
    local web_devicons = require("nvim-web-devicons")

    require("bufferline").setup({
      options = {
        -- numbers = "none" | "ordinal" | "buffer_id" | "both"
        -- numbers = "ordinal",
        -- match background color
        style_preset = require("bufferline").style_preset.minimal,
        right_mouse_command = false,
        middle_mouse_command = false,
        modified_icon = "",
        indicator = { style = "underline" },

        -- always show file's immediate parent
        name_formatter = function(buf)
          local path = buf.path
          local parts = {}
          for part in string.gmatch(path, "[^/\\]+") do
            table.insert(parts, part)
          end

          local len = #parts
          if len > 1 then
            return parts[len - 1] .. "/" .. parts[len]
          else
            return parts[len]
          end
        end,

        max_name_length = 50,
        max_prefix_length = 30,
        truncate_names = false,
        offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left", separator = true } },

        show_buffer_icons = true,
        get_element_icon = function(element)
          local icon, hl = web_devicons.get_icon_by_filetype(element.filetype, { default = false })
          return icon, hl
        end,

        show_buffer_close_icons = false,
        show_close_icon = false,
        hover = { enabled = false },

        groups = { items = { groups.builtin.pinned:with({ icon = "" }) } },
        pick = { alphabet = "jklasdfghqwertyuiopzxcvbnm" },
      },
    })
  end,
}
