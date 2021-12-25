local status_ok, echodoc = pcall(require, "echodoc")
if not status_ok then
	return
end

vim.api.nvim_exec(
[[
" using neovim's floating text feature
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu
]],
true)

