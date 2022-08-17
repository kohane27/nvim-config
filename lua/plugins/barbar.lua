local status_ok, barbar = pcall(require, "bufferline")
if not status_ok then
  return
end

barbar.setup({
  animation = false,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {},
  exclude_name = {},

  icons = "both",
  icon_custom_colors = true,
  icon_separator_active = "▎",
  icon_separator_inactive = "▎",
  icon_close_tab = "",
  icon_close_tab_modified = "",
  -- icon_close_tab_modified = "●",
  icon_pinned = "車",

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- max padding width surrounding each tab
  maximum_padding = 1,
  -- max buffer name length
  maximum_length = 15,
  semantic_letters = true,
  letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. Only a static string is accepted here.
  no_name_title = nil,
})

-- offset for nvim-tree
local nvim_tree_events = require("nvim-tree.events")
local bufferline_state = require("bufferline.state")

nvim_tree_events.on_tree_open(function()
  bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function()
  bufferline_state.set_offset(0)
end)
