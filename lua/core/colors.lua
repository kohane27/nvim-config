-- ╭──────────────────────────────────────────────────────────╮
-- │ Color schemes configuration file                         │
-- │ See:https://github.com/brainfucksec/neovim-lua#appearance│
-- ╰──────────────────────────────────────────────────────────╯
require("onenord").setup({
  borders = true, -- Split window borders
  fade_nc = true, -- Fade non-current windows, making them more distinguishable
  -- Style that is applied to various groups: see `highlight-args` for options
  styles = {
    comments = "italic",
    strings = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "underline",
  },
})
vim.cmd([[
" colorscheme nordfox
colorscheme onenord
" colorscheme tokyonight-storm
" colorscheme catppuccin-frappe
]])
