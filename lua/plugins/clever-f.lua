vim.cmd([[
hi CharColor guifg=#ffffff guibg=NONE guisp=NONE gui=undercurl
" search a char only in current line
let g:clever_f_across_no_line=1
" ignore case
let g:clever_f_ignore_case=1
" highlighting char which can be directly jumped to
let g:clever_f_mark_direct=0
" target char highlighting in current line
let g:clever_f_mark_char_color = "CharColor"
" highlight timeout
let g:clever_f_highlight_timeout_ms=3000
" match all symbols with one char
let g:clever_f_chars_match_any_signs=";"
]])
