vim.cmd [[
"run in every buffer
let g:hardtime_default_on = 1
"tweak the timeout allowed between keypresses in milliseconds
let g:hardtime_timeout = 1000
let g:list_of_normal_keys = ["h", "j", "k", "l"]
let g:list_of_visual_keys = ["h", "j", "k", "l"]
let g:list_of_insert_keys = ["<C-w>"]
"keys added below are disabled in all of normal, visual and insert modes.
let g:list_of_disabled_keys = []
]]
