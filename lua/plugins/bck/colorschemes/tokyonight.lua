local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  print("tokyonight not working")
end

tokyonight.setup({
  style = "storm", -- `storm`, `moon`, a darker variant `night` and `day`
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "NvimTree", "vista_kind", "help", "terminal", "packer" }, -- darker background on sidebar-like windows
  hide_inactive_statusline = false, -- hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
})
