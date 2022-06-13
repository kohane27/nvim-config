local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  print("bufferLine failing")
end

bufferline.setup({
  options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    mode = "buffers", -- "tabs" to only show tabpages instead
    -- view = "multiwindow",
    numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both"
    max_name_length = 5,
    max_prefix_length = 5, -- prefix used when a buffer is de-duplicated
    tab_size = 10,
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = true,
    show_buffer_default_icon = true, -- whether an unrecognised filetype should show a default icon
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = "slant", --"slant" | "thick" | "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    themable = true,
  },
})
