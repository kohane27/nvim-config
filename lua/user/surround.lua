local status_ok, surround = pcall(require, "surround")
if not status_ok then
	return
end

-- make it compatible with lightspeed
vim.cmd([[
let g:surround_no_mappings = 1
nmap ds       <Plug>Dsurround
nmap cs       <Plug>Csurround
nmap cS       <Plug>CSurround
nmap ys       <Plug>Ysurround
nmap yS       <Plug>YSurround
nmap yss      <Plug>Yssurround
nmap ySs      <Plug>YSsurround
nmap ySS      <Plug>YSsurround
xmap gs       <Plug>VSurround
xmap gS       <Plug>VgSurround
]])
