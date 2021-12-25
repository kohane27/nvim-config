vim.cmd [[
try
  colorscheme doom-one
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
