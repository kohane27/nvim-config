vim.cmd([[
" run in every buffer
let g:hardtime_default_on = 1
" timeout allowed in milliseconds
let g:hardtime_timeout = 1000
let g:list_of_normal_keys = ["w", "b" ]
" let g:list_of_visual_keys = ["h", "l"]
" let g:list_of_insert_keys = ["<C-w>", "<C-h>"]
" keys disabled in all of normal, visual and insert modes.
let g:list_of_disabled_keys = []

" enable Notification
let g:hardtime_showmsg = 0

" ignore Buffers
let g:hardtime_ignore_buffer_patterns = [ "NvimTree.*", "NERD.*", "nvim-tree" ]

" ignore Quickfix
let g:hardtime_ignore_quickfix = 1
]])
