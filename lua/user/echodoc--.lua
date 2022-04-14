vim.cmd([[
set cmdheight=2
set noshowmode

" using neovim's floating text feature
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'

" To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu
]])
