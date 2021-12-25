vim.api.nvim_exec(
[[
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=FiraCode\ Nerd\ Font:h11

let neovide_remember_window_size = v:true
let g:neovide_refresh_rate=60
let g:neovide_input_use_logo=v:true
let g:neovide_cursor_animation_length=0
let g:neovide_cursor_trail_length=0
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_mode = ""
]],
true)

