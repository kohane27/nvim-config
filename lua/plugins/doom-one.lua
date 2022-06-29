local status_ok, doom_one = pcall(require, "doom-one")
if not status_ok then
  return
end

-- hello
doom_one.setup({
  cursor_coloring = false,
  terminal_colors = false,
  italic_comments = false,
  enable_treesitter = true,
  transparent_background = false,
  pumblend = {
    enable = true,
    transparency_amount = 20,
  },
  plugins_integrations = {
    barbar = true,
    gitgutter = true,
    gitsigns = true,
    nvim_tree = true,
    whichkey = true,
    indent_blankline = true,
    neorg = false,
    bufferline = false,
    telescope = false,
    neogit = false,
    dashboard = false,
    startify = false,
    vim_illuminate = false,
    lspsaga = false,
  },
})
