-- ╭──────────────────────────────────────────────────────────╮
-- │ Color schemes configuration file                         │
-- │ See:https://github.com/brainfucksec/neovim-lua#appearance│
-- ╰──────────────────────────────────────────────────────────╯

vim.opt.laststatus = 3
vim.opt.fillchars:append({
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┨",
  vertright = "┣",
  verthoriz = "╋",
})

require("kanagawa").setup({
  transparent = false, -- do not set background color
  dimInactive = true, -- dim inactive window `:h hl-NormalNC`
  colors = {
    theme = { all = { ui = { bg_gutter = "none" } } },
  },
})

vim.cmd([[
colorscheme kanagawa-wave
" colorscheme nordfox
" colorscheme onenord
" colorscheme tokyonight-storm
" colorscheme catppuccin-frappe
]])
