-- make it compatible with lightspeed
vim.cmd([[
let g:surround_no_mappings = 1
nmap ds       <Plug>Dsurround
nmap cs       <Plug>Csurround
nmap ys       <Plug>Ysurround
nmap yss      <Plug>Yssurround
xmap gs       <Plug>VSurround
]])
