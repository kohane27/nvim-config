vim.cmd([[
"run in every buffer
let g:hardtime_default_on = 1
"tweak the timeout allowed between keypresses in milliseconds
let g:hardtime_timeout = 500
let g:list_of_normal_keys = ["h", "l"]
" let g:list_of_normal_keys = ["h", "j", "k", "l"]
let g:list_of_visual_keys = ["h", "l"]
let g:list_of_insert_keys = ["<C-w>", "<C-h>"]
"keys added below are disabled in all of normal, visual and insert modes.
let g:list_of_disabled_keys = []

"Enable Notification
let g:hardtime_showmsg = 0

"Ignore Buffers
let g:hardtime_ignore_buffer_patterns = [ "NvimTree.*", "NERD.*" ]

"Ignore Quickfix
let g:hardtime_ignore_quickfix = 1
]])
