-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- See: https://github.com/brainfucksec/neovim-lua#appearance

-- Load nvim color scheme:
-- Change the "require" values with your color scheme
-- Available color schemes: onedark, monokai
local status_ok, color_scheme = pcall(require, 'onedark')
if not status_ok then
  return
end

-- vim.cmd [[
-- try
--     set background=dark
--     colorscheme doom-one
--     " for vsplits
--     set fillchars=vert:┃ 
--     " for folds
--     set fillchars+=fold:· 
--     " TODO not working
--     hi VertSplit guifg=#FF5C8F ctermfg=123
--
-- catch /^Vim\%((\a\+)\)\=:E185/
--       set background=dark
--       colorscheme default
-- endtry
-- ]]

-- OneDark styles: dark, darker, cool, deep, warm, warmer, light
require('onedark').setup {
  style = 'dark',
  colors = { fg = '#b2bbcc' }, --default: #a0a8b7
}
require('onedark').load()

-- statusline color schemes:
-- import with: require('colors').colorscheme_name
local M = {}

-- Theme: OneDark (dark)
-- Colors: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
M.onedark_dark = {
  bg = '#282c34',
  fg = '#b2bbcc',
  pink = '#c678dd',
  green = '#98c379',
  cyan = '#56b6c2',
  yellow = '#e5c07b',
  orange = '#d19a66',
  red = '#e86671',
}

-- Theme: Monokai (classic)
-- Colors: https://github.com/tanvirtin/monokai.nvim/blob/master/lua/monokai.lua
M.monokai = {
  bg = '#202328', --default: #272a30
  fg = '#f8f8f0',
  pink = '#f92672',
  green = '#a6e22e',
  cyan = '#66d9ef',
  yellow = '#e6db74',
  orange = '#fd971f',
  red = '#e95678',
}

return M


