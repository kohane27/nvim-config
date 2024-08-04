return {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",
  opts = {
    ---Render style
    ---@usage 'background'|'foreground'|'virtual'
    render = "background",

    ---Highlight named colors, e.g. 'green'
    enable_named_colors = false,

    ---Highlight tailwind colors, e.g. 'bg-blue-500'
    enable_tailwind = true,
  },
}
